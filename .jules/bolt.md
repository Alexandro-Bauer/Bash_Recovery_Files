## 2024-05-24 - Optimize dd block size for file carving
**Learning:** Using `bs=1` with `dd` for file carving creates massive system call overhead and significantly slows down recovery.
**Action:** Use a larger block size (e.g., `bs=4M`) combined with `iflag=skip_bytes,count_bytes` to drastically reduce system call overhead while maintaining exact byte-level precision.
