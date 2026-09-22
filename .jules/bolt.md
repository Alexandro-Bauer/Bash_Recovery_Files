## 2024-09-22 - Replacing dd bs=1 with tail/head for file carving
**Learning:** Using `dd bs=1 skip=N count=M` forces single-byte reads/writes, causing massive system call overhead and terrible performance.
**Action:** Always replace byte-level `dd bs=1` operations with the `tail -c +$((N + 1)) ... | head -c M` pipeline, which uses buffered I/O and provides a 100x+ speedup.
