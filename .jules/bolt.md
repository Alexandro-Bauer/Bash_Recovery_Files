## 2026-07-20 - [Avoid dd bs=1 for performance]
**Learning:** `dd bs=1` performs a system `read()` and `write()` for every single byte, which introduces massive overhead and is notoriously slow for large or offset extractions in bash scripts.
**Action:** Replace `dd bs=1 skip=X count=Y` with the highly performant buffered I/O pipeline `tail -c +$((X + 1)) | head -c Y` when doing byte-level file extraction. Ensure `+1` is added since `tail -c` is 1-indexed.
