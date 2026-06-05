## 2024-06-04 - Optimize file carving block size for dd

**Learning:** Using `bs=1` in `dd` for byte-level extraction causes massive system call overhead (O(N) system calls for N bytes). However, byte-precise extraction is still achievable with large block sizes in GNU `dd` by using `iflag=skip_bytes,count_bytes`.
**Action:** When using `dd` for file carving, always use a larger block size (e.g., `bs=4M`) combined with `iflag=skip_bytes,count_bytes` instead of `bs=1` to drastically reduce system call overhead while maintaining exact byte-level precision.
