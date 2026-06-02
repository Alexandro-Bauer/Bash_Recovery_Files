## 2026-06-02 - Optimize dd block size for file carving
**Learning:** Using `dd` with `bs=1` for file carving operations results in massive system call overhead (processing the file one byte at a time).
**Action:** When using `dd` for file carving operations, always use a larger block size (e.g., `bs=4M`) combined with `iflag=skip_bytes,count_bytes` instead of `bs=1`. This drastically reduces system call overhead while maintaining exact byte-level precision (providing a ~500x speedup).
