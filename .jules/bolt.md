## 2024-06-30 - System Calls Overhead in dd

**Learning:** Using `dd` with `bs=1` causes extreme performance degradation due to a huge number of `read()` and `write()` system calls, slowing down byte-exact extractions by several orders of magnitude.
**Action:** When extracting data using byte offsets with GNU `dd`, increase the block size (e.g., `bs=4M`) and use the specific flag `iflag=skip_bytes,count_bytes` to read chunks at a time while strictly maintaining precise byte-level constraints, reducing execution time drastically.
