## 2026-06-24 - Optimize file carving operations
**Learning:** Using `dd` with `bs=1` causes a significant system call bottleneck by reading and writing one byte at a time. This results in massive performance overhead for larger files.
**Action:** Always use a larger block size (e.g., `bs=4M`) combined with `iflag=skip_bytes,count_bytes` for `dd` carving operations in GNU environments to preserve byte-level precision while drastically reducing system call overhead.
