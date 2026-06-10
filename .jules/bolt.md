## 2026-06-10 - Optimize `dd` file carving operations

**Learning:** Using `dd` with `bs=1` for precise byte-level file carving introduces a massive performance bottleneck due to excessive system call overhead (one read/write per byte).
**Action:** Always combine a larger block size (e.g., `bs=4M`) with `iflag=skip_bytes,count_bytes` to drastically reduce system calls while maintaining exact byte-level precision in file carving.
