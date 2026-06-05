## 2024-05-24 - dd File Carving Performance
**Learning:** Using `dd` with `bs=1` for file carving operations creates immense system call overhead, severely impacting performance for large files.
**Action:** Always use a larger block size (e.g., `bs=4M`) combined with `iflag=skip_bytes,count_bytes` instead of `bs=1` to drastically reduce system call overhead while maintaining exact byte-level precision.
