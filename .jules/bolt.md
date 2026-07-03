## 2024-07-03 - [dd bs=1 Bottleneck]
**Learning:** Using `dd` with `bs=1` causes an extreme performance bottleneck due to issuing a system call for every single byte processed. The script `MCSDF_DataRescue_V21.sh` and `extract.sh` were severely limited by this pattern for file extraction.
**Action:** Always prefer large block sizes (e.g., `bs=4M`) with byte precision flags (e.g., `iflag=skip_bytes,count_bytes` on GNU dd) to drastically reduce system overhead while preserving exact data carving logic.
