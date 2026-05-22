## 2026-05-21 - [Optimize dd block size for file carving]
**Learning:** Using `bs=1` in `dd` creates extreme system call overhead for large file carving operations, representing a massive performance bottleneck.
**Action:** When using `dd` to carve files out of disk images, always use a larger block size (e.g., `bs=4M`) combined with `iflag=skip_bytes,count_bytes` instead of `bs=1` with `skip` and `count` to maintain byte-level precision while drastically reducing overhead.
