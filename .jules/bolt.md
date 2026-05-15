
## 2026-05-15 - Optimize dd block size for file extraction
**Learning:** Using `bs=1` in `dd` means one system call per byte, which is a massive performance bottleneck for extracting large files. `iflag=skip_bytes,count_bytes` allows `dd` to perform exact byte-level seeking and extraction while using large block sizes (e.g. `bs=4M`).
**Action:** When extracting data with `dd`, always combine `bs=4M` (or similarly large blocks) with `iflag=skip_bytes,count_bytes` instead of using `bs=1`.
