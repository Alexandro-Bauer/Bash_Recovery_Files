## 2024-05-18 - `dd` Block Size Optimization for Byte-level Carving
**Learning:** Using `dd bs=1` to achieve precise byte-level extraction (common in forensic file carving scripts) causes a massive system call bottleneck, slowing down execution immensely on larger files.
**Action:** In GNU `dd` environments, use `bs=4M iflag=skip_bytes,count_bytes` instead. This preserves exact byte-level slicing capability while drastically reducing overhead by allowing `dd` to operate on larger chunks.
