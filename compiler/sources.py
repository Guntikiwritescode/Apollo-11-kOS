# lists every source line and rope word, build_ir.py runs this
import collections
import hashlib
import json
from pathlib import Path
import re
import sys
import zipfile

from listing import checked_words, INPUTS, PROGRAMS

OUT = Path(sys.argv[1])
OUT.mkdir(exist_ok=False)
normal_timing = [0,0,0,0,1,0,0,0,2,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1]
extra_timing = [1,1,1,1,5,0,0,0,1,1,1,1,2,2,2,2,2,2,2,2,1,1,1,1,1,0,0,0,2,2,2,2]
pass_source = (INPUTS / 'virtualagc/yaYUL/Pass.c').read_text()
basic_table = pass_source.split('ParsersBlock2[]')[1].split('static ParserMatch_t ParsersBLK2[]')[0]
interp_table = pass_source.split('InterpreterOpcodesBlock2[]')[1].split('static InterpreterMatch_t InterpreterOpcodesBLK2[]')[0]
source_types = dict(re.findall(r'^\s*\{\s*"([^"]+)",\s*OP_(\w+)', basic_table, re.M))
interpretive = dict((name, int(code, 8)) for name, code in re.findall(r'^\s*\{\s*"([^"]+)",\s*([0-7]+)', interp_table, re.M))

def word_kind(op, offset):
    if offset:
        return 'continuation'
    if not op:
        return 'bare'
    if op in interpretive:
        return 'interpretive-pair'
    if op == '-CCS':
        return 'encoded-constant'
    if op == 'NOOP':
        return 'basic-alias'
    if op in source_types:
        return source_types[op].lower()
    if re.fullmatch(r'[+-]?[0-7]+', op):
        return 'numeric-order'
    return 'unclassified'

def decode(major_word, extra):
    major, sub = major_word >> 12, (major_word >> 10) % 4
    if extra:
        table = (
            ('READ','WRITE','RAND','WAND','ROR','WOR','RXOR','EDRUPT')[(major_word >> 9) % 8],
            ('DV','BZF','BZF','BZF')[sub], ('MSU','QXCH','AUG','DIM')[sub],
            'DCA','DCS','INDEX',('SU','BZMF','BZMF','BZMF')[sub],'MP')
        base = table[major]
        if base == 'INDEX' and major_word & 4095 == 0o36: base = 'RESUME'
        return base
    table = (
        {3:'RELINT',4:'INHINT',6:'EXTEND'}.get(major_word & 4095,'TC'),
        ('CCS','TCF','TCF','TCF')[sub], ('DAS','LXCH','INCR','ADS')[sub],
        'CA','CS',('INDEX','DXCH','TS','XCH')[sub], 'AD','MASK')
    base = table[major]
    if base == 'INDEX' and major_word & 1023 == 0o17: base = 'RESUME'
    return base

with zipfile.ZipFile(INPUTS / 'Apollo-11-master.zip') as archive:
    for program in PROGRAMS:
        raw_by_file = {}
        info = collections.Counter()
        slots = {}
        sources = {}
        for name in archive.namelist():
            if not re.search(fr'/{program}/[^/]+\.agc$', name):
                continue
            raw = archive.read(name)
            raw_lines = raw.decode('utf-8').splitlines(keepends=True)
            assert ''.join(raw_lines).encode('utf-8') == raw
            file = name.rsplit('/',1)[1]
            raw_by_file[file] = raw_lines
            sources[file] = {'original_sha256': hashlib.sha256(raw).hexdigest(), 'line_count':len(raw_lines)}
        for file, line, bank, address, word, op, offset in checked_words(program):
            slot = (bank, address % 1024)
            assert slot not in slots and file in raw_by_file and 0 < line <= len(raw_by_file[file])
            kind = word_kind(op,offset)
            slots[slot] = {
                'address_octal': f'{address:04o}', 'source': file, 'line': line,
                'word': word, 'kind': kind, 'source_operator': op, 'line_word_offset': offset,
                'normal': decode(word, False), 'extended': decode(word, True),
            }
        rope = (INPUTS / program / 'MAIN.agc.bin').read_bytes()
        outputs = collections.defaultdict(list)
        with (OUT/f'{program}.fixed.jsonl').open('w') as target:
            for bank in range(36):
                for offset in range(1024):
                    block = {0:2,1:3,2:0,3:1}.get(bank,bank)
                    index = 2 * (1024*block + offset)
                    raw = int.from_bytes(rope[index:index+2], 'big')
                    slot = 2048 + 1024 * bank + offset
                    record = {'slot':slot, 'bank':bank,'offset':offset, 'word':raw >> 1, 'physical_word':raw, 'kind':'unlisted'}
                    if (bank, offset) in slots:
                        record.update(slots[bank,offset])
                        assert record['word'] == raw >> 1
                        outputs[record['source'],record['line']].append(slot)
                    word = record['word']
                    record['normal'] = decode(word, False)
                    record['extended'] = decode(word, True)
                    record['normal_base_mct'] = 1 + normal_timing[word >> 10]
                    record['extended_base_mct'] = 1 + extra_timing[word >> 10]
                    previous = slots.get((bank, offset - 1))
                    if previous and previous['source_operator'] in {'INDEX','NDX','EXTEND'}:
                        record['lexical_predecessor_order'] = previous['source_operator']
                        info['after-'+previous['source_operator']] += 1
                    info[record['kind']] += 1
                    if record['kind'] == 'unlisted' and record['word']:
                        info['unlisted-nonzero'] += 1
                    target.write(json.dumps(record,ensure_ascii=False)+'\n')
        with (OUT/f'{program}.source.jsonl').open('w') as target:
            for source, lines in raw_by_file.items():
                for line, original in enumerate(lines,1):
                    output_slots = outputs[source,line]
                    target.write(json.dumps({'source':source,'line':line,'text':original,'fixed_slots':output_slots},ensure_ascii=False)+'\n')
                    info['source-lines'] += 1
                    if '#' in original:
                        info['hash-bearing-lines'] += 1
        summary = {'program':program,'rope_sha256':hashlib.sha256(rope).hexdigest(),'source_files':sources,'counts':dict(info)}
        (OUT/f'{program}.summary.json').write_text(json.dumps(summary,indent=2)+'\n')
        print(program, 'source_files',len(sources), dict(info))
