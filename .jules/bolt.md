## 2024-06-29 - Optimize file carving dd operations
**Learning:** When using `dd` for file carving operations in Linux/GNU environments, always use a larger block size (e.g., `bs=4M`) combined with `iflag=skip_bytes,count_bytes` instead of `bs=1` to drastically reduce system call overhead while maintaining exact byte-level precision.
**Action:** Always check `dd` usage and update it to use `bs=4M iflag=skip_bytes,count_bytes` for better performance on large file carving tasks.
