## 2024-05-06 - dd Block Size Bottleneck
**Learning:** Using `dd` with `bs=1` causes an extreme performance bottleneck because it performs one read and one write system call per byte.
**Action:** Always use a larger block size (e.g., `bs=4M`) combined with `iflag=skip_bytes,count_bytes` to maintain byte-level precision while copying blocks efficiently.
