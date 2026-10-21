## 2024-10-21 - [Optimize File Carving]
**Learning:** `dd bs=1` is used for file carving but it's extremely slow because it processes files byte-by-byte. Using `tail -c | head -c` pipeline provides massive speedups because it operates efficiently on streams without the byte-by-byte syscall overhead. I also need to be careful with 0-indexing of `dd skip` vs 1-indexing of `tail -c`.
**Action:** Replace `dd if=... bs=1 skip=... count=...` with `tail -c +$((start + 1)) ... | head -c $count ...` for file carving operations in Bash scripts.
