## 2026-06-12 - Optimized file carving with dd
**Learning:** `dd` carving using `bs=1` and `skip=...` performs byte-by-byte system calls which is extremely slow on large files.
**Action:** Always use a larger block size (e.g. `bs=4M`) combined with `iflag=skip_bytes,count_bytes` for byte-level precision without the overhead of tiny system calls.
