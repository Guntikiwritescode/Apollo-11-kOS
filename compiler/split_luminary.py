"""Split Luminary's oversized generated file at a completed top-level statement."""
import gzip
import json
from pathlib import Path
import sys

root = Path(sys.argv[1])
source = root / 'source/s050.ks'
lines = source.read_text().splitlines(keepends=True)
assert len(lines) == 34864
cut = 17404
assert lines[cut - 1] == ')).\n'
(root / 'source/s050b.ks').write_text(''.join(lines[cut:]))
source.write_text(''.join(lines[:cut]))
loader = root / 'load.ks'
text = loader.read_text()
old = 'runpath("0:/source/s050.ks").\n'
assert text.count(old) == 1
loader.write_text(text.replace(old, old + 'runpath("0:/source/s050b.ks").\n'))
for name in ('provenance.jsonl.gz', 'emission.jsonl.gz'):
    path = root / name
    with gzip.open(path, 'rt') as stream:
        records = [json.loads(line) for line in stream]
    for record in records:
        if name.startswith('provenance') and record.get('generated') == 'source/s050.ks' and record['marker_line'] > cut:
            record['generated'] = 'source/s050b.ks'
            for key in ('marker_line', 'text_line', 'literal_line'):
                if key in record:
                    record[key] -= cut
        entry = record.get('generated_entry', {})
        if entry.get('path') == 'source/s050.ks' and entry['line'] > cut:
            entry['path'] = 'source/s050b.ks'
            entry['line'] -= cut
    with gzip.open(path, 'wt') as stream:
        for record in records:
            stream.write(json.dumps(record, sort_keys=True) + '\n')
