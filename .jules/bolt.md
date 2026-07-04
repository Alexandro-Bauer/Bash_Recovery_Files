## 2024-07-04 - Optimize dd block size for file carving
**Learning:** Using `dd` with `bs=1` causes a massive number of `read()` and `write()` system calls, creating a severe performance bottleneck. GNU `dd` supports `iflag=skip_bytes,count_bytes` which allows using a large block size (e.g. `bs=4M`) while preserving byte-level accuracy.
**Action:** Always use large block sizes combined with `iflag=skip_bytes,count_bytes` when using `dd` to perform exact byte-level file operations in GNU environments.
