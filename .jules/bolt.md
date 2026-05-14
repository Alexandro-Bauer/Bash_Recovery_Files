## 2024-05-13 - [dd extraction system call bottleneck]
**Learning:** Using `dd` with `bs=1` for byte-level precision in file carving causes massive system call overhead (one read/write syscall per byte), leading to extreme slowdowns. GNU `dd` supports `iflag=skip_bytes,count_bytes`, which allows for byte-level precision while using large block sizes (e.g. `bs=4M`).
**Action:** When using `dd` for byte-specific offsets, always use a large block size (like `4M`) combined with `iflag=skip_bytes,count_bytes` instead of `bs=1`.
