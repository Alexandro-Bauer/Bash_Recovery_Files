## 2024-05-08 - Optimized dd block size for faster file carving
**Learning:** Default dd behavior of bs=1 performs a read and write syscall for every single byte, creating enormous overhead. By increasing bs (block size) to a larger value (like 4M) and using iflag=skip_bytes,count_bytes, we can read/write data in much larger chunks while still specifying exact byte offsets.
**Action:** When carving files using `dd` in bash scripts with specific byte start/end positions, always use `bs=4M iflag=skip_bytes,count_bytes` instead of `bs=1` to dramatically speed up operations (often 1000x faster).
