## 2026-08-13 - [Massive File Carving Speedup via Shell Built-ins]
**Learning:** Using `dd bs=1` for file carving is exceptionally slow because it forces the system into byte-by-byte `read()` and `write()` system calls, drastically slowing down processing of large chunks.
**Action:** Always replace byte-level `dd bs=1 skip=N count=M` extraction with the highly performant `tail -c +$((N + 1)) | head -c M` pipeline. Ensure to check pipeline success by testing if the output file is non-empty (`[ -s "$file" ]`) instead of relying on `$?`, which can be unreliable without `pipefail`.
