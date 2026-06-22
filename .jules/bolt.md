## 2024-06-22 - Optimize dd block size for file carving
**Learning:** Using `bs=1` with `dd` for extracting exact byte ranges causes massive system call overhead (e.g., 33s for 10MB vs 0.1s with `bs=4M iflag=skip_bytes,count_bytes`). GNU `dd` supports `iflag=skip_bytes,count_bytes` which allows fast seek and extraction with large block sizes while maintaining exact byte boundaries.
**Action:** Always replace `bs=1 skip=X count=Y` with `bs=4M iflag=skip_bytes,count_bytes skip=X count=Y` in GNU environments for file carving operations.
