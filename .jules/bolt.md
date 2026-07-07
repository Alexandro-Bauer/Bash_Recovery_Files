## 2024-07-25 - Optimize dd block sizes
**Learning:** Using `dd` with `bs=1` for file carving creates excessive system call overhead, drastically slowing down extraction.
**Action:** Always use a larger block size like `bs=4M` combined with `iflag=skip_bytes,count_bytes` (in GNU/Linux) to maintain byte-level precision while vastly improving performance.
