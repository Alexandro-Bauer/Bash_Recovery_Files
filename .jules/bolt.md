
## 2023-10-24 - File Carving Bottleneck
**Learning:** Using `dd bs=1` for byte-level file extraction in bash loops is a massive performance bottleneck due to the per-byte context switching overhead.
**Action:** Always replace `dd bs=1 skip=X count=Y` with the high-performance pipeline `tail -c +$((X + 1)) | head -c Y`.
