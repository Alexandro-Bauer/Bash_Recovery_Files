## 2024-10-24 - [File Carving Bottleneck]
**Learning:** Using `dd bs=1` for byte-level file extraction from large disk images is notoriously slow due to byte-by-byte read/write operations.
**Action:** Replace `dd bs=1 skip=$start count=$count` with the `tail -c +$((start + 1)) | head -c $count` pipeline for massive performance gains, and ensure `tail` stderr is suppressed and exit code + file integrity (`-s`) are verified.
