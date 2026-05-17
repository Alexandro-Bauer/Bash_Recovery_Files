## 2024-05-18 - File carving with `dd`
**Learning:** Using `bs=1` for byte-precise extraction with `dd` incurs catastrophic system call overhead because it reads and writes one single byte per system call.
**Action:** When carving files using byte offsets, combine a large block size (e.g., `bs=4M`) with `iflag=skip_bytes,count_bytes` to minimize system calls while retaining exact byte-level precision.
