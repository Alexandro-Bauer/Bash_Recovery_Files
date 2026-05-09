## 2024-03-24 - [Avoid `bs=1` for `dd` commands]
**Learning:** Using `bs=1` in `dd` creates a system call for every single byte, which introduces massive overhead, particularly during file carving operations that process thousands or millions of bytes.
**Action:** When using `dd` for byte-precise extraction, use a large block size (e.g., `bs=4M`) combined with `iflag=skip_bytes,count_bytes` to drastically reduce system call overhead while maintaining exact byte-level precision.
