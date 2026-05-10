## 2024-06-25 - [Optimize dd block size for file carving]
**Learning:** Using `dd` with `bs=1` causes a massive amount of system calls and severely slows down file carving.
**Action:** Use `bs=4M iflag=skip_bytes,count_bytes` to allow `dd` to read/write in large chunks while preserving exact byte skipping/counting.
