## 2024-06-03 - [dd Block Size Bottleneck]
**Learning:** Using `bs=1` for file carving operations in `dd` creates a massive system call bottleneck (one read/write per byte), slowing operations linearly with file size.
**Action:** Always use a larger block size (e.g., `bs=4M`) combined with `iflag=skip_bytes,count_bytes` for byte-level precision when extracting subsets of files with `dd`.
