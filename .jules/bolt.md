## 2024-06-15 - [Optimize dd block size for file carving]
**Learning:** Using `dd` with `bs=1` for extracting file contents causes a system call for every single byte read and written, leading to catastrophic performance overhead.
**Action:** Use a large block size like `bs=4M` combined with `iflag=skip_bytes,count_bytes` to drastically reduce system call overhead while maintaining exact byte-level precision.
