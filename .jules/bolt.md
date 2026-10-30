## 2026-10-30 - [Optimize byte carving performance]
**Learning:** The previous implementation used `dd bs=1` to extract exact byte ranges, which resulted in significant overhead from thousands of 1-byte read/write syscalls.
**Action:** Using the `tail -c +$((START + 1)) | head -c $LENGTH` pipeline offers a portable, highly performant alternative for exact byte carving, reducing execution time significantly on large files. Make sure to account for `tail`'s 1-indexed offset by adding +1 to standard 0-indexed byte offsets.
