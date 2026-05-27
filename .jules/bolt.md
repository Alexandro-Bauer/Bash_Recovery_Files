## 2026-05-27 - Optimizing dd file carving performance
**Learning:** Using `dd` with `bs=1` for byte-level extraction causes massive system call overhead. By using a larger block size (e.g., `bs=4M`) combined with `iflag=skip_bytes,count_bytes`, we drastically reduce system calls while maintaining exact byte-level precision.
**Action:** When performing file carving with `dd`, always prefer `bs=4M iflag=skip_bytes,count_bytes` over `bs=1`.
