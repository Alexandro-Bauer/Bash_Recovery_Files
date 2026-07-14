## 2024-07-14 - Replace dd bs=1 with tail/head for faster file carving
**Learning:** Using `dd bs=1` for byte-level carving is extremely slow because it processes one byte at a time with huge syscall overhead. The pipeline `tail -c +$((start + 1)) file | head -c $count > out` is approximately 180x faster.
**Action:** Always prefer the `tail | head` pipeline over `dd bs=1` for byte-level extraction in bash scripts when portability to BSD/macOS is required.
