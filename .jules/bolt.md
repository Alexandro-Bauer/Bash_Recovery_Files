## 2024-06-01 - Optimize dd Block Size in File Carving

**Learning:** The file recovery script was using `dd bs=1 skip=... count=...` which caused extreme system call overhead (one read/write per byte). However, `dd` supports GNU extensions `iflag=skip_bytes,count_bytes` that allow block-based transfers while keeping byte precision for `skip` and `count`.

**Action:** Whenever `dd` is used to copy byte-exact ranges, use `bs=4M iflag=skip_bytes,count_bytes` instead of `bs=1` to vastly improve throughput without losing byte-level accuracy.
