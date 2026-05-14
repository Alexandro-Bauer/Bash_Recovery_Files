## 2024-05-15 - [File Carving Optimization]
**Learning:** Using `dd` with `bs=1` causes a massive system call overhead because it reads and writes data one byte at a time. This is a severe bottleneck during forensic file carving.
**Action:** When extracting data using byte offsets, use `bs=4M iflag=skip_bytes,count_bytes` to allow `dd` to read/write in large blocks while still interpreting `skip` and `count` parameters as exact byte values, improving performance by orders of magnitude.
