## 2024-05-24 - File Carving Performance Optimization
**Learning:** Using `dd` with `bs=1` for file carving operations in Linux/GNU environments causes massive system call overhead (reading and writing one byte at a time).
**Action:** Always use a larger block size (e.g., `bs=4M`) combined with `iflag=skip_bytes,count_bytes` instead of `bs=1` to drastically reduce system call overhead while maintaining exact byte-level precision.
