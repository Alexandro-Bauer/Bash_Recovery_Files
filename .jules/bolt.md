
## 2024-05-23 - [Optimize File Carving]
**Learning:** Using `dd bs=1` for file carving operations imposes significant system call overhead. By increasing the block size (e.g. `bs=4M`) and combining it with `iflag=skip_bytes,count_bytes`, exact byte-level precision is maintained while drastically reducing execution time (from ~1.5s to ~0.004s for a 500KB extraction in local benchmarks).
**Action:** When using `dd` for carving files or extracting byte-precise sections, always utilize a larger block size with byte-oriented skip and count flags instead of `bs=1` to minimize system call overhead and improve throughput.
