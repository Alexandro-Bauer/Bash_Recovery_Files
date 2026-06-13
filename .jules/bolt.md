## 2024-06-13 - Optimize dd block size for file extraction
**Learning:** Using `bs=1` in `dd` for byte-level precision file extraction incurs massive system call overhead.
**Action:** Always use a larger block size (e.g., `bs=4M`) combined with `iflag=skip_bytes,count_bytes` instead of `bs=1` to drastically reduce system call overhead while maintaining exact byte-level precision.
