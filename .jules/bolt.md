## 2026-05-28 - Avoid bs=1 in dd for performance
**Learning:** Using `bs=1` in `dd` creates extreme system call overhead because it reads and writes one byte at a time. This severely bottlenecks file carving in bash scripts.
**Action:** Always use a larger block size (e.g., `bs=4M`) combined with `iflag=skip_bytes,count_bytes` instead of `bs=1`. This reduces syscall overhead by orders of magnitude while still maintaining exact byte-level precision.
