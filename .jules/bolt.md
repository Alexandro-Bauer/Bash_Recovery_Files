## 2024-11-20 - [File Carving Optimization]
**Learning:** Using `dd bs=1` for byte-level file carving is extremely slow due to the 1-byte buffer size forcing millions of system calls.
**Action:** Always prefer the `tail -c +$((start + 1)) | head -c $count` pipeline for byte-precise extraction, which uses larger buffers and is much faster.
