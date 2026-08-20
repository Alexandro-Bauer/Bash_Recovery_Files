## 2024-08-20 - [Replace slow dd file carving]
**Learning:** `dd bs=1` is extremely slow for byte-level carving of large files.
**Action:** Use a `tail -c | head -c` pipeline instead for significantly better performance.
