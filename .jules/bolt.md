## 2024-05-15 - dd vs tail/head for file carving
**Learning:** Using `dd bs=1` for file carving is extremely slow because it forces a system read/write syscall for every single byte. Using `tail -c +$((start + 1)) | head -c $count` utilizes standard buffered I/O and provides massive speedups for shell-based file recovery.
**Action:** Always prefer `tail -c | head -c` over `dd bs=1` when extracting portions of a file in bash scripts. Ensure correct 1-based indexing for `tail -c`.
