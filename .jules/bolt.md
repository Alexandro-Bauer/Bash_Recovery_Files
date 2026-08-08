## 2024-08-08 - Optimize Byte-level File Carving
**Learning:** The `dd bs=1` command forces a syscall for every byte and is extremely slow for carving data blocks. In shell scripts, the `tail -c +$((start + 1)) | head -c $count` pipeline provides the same exact extraction with standard I/O buffering and works ~100x faster.
**Action:** Always prefer `tail -c | head -c` over `dd bs=1` when extracting specific sub-sections of a file based on offsets in shell scripts. Keep in mind `tail` is 1-indexed and `dd` skip is 0-indexed.
