## 2026-05-07 - Optimize dd block sizes
**Learning:** Using `dd` with `bs=1` creates massive I/O overhead as the OS must execute read/write syscalls for every byte.
**Action:** Use a larger block size (e.g., `bs=4M`) with `iflag=skip_bytes,count_bytes` to buffer I/O while evaluating byte-level bounds accurately.
