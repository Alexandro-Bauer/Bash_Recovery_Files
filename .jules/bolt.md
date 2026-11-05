## 2024-05-24 - [Replace slow dd bs=1 with tail | head for file carving]
**Learning:** Using `dd bs=1 skip=$offset count=$length` for byte-level extraction in Bash is extremely slow because it processes one byte at a time. The pipeline `tail -c +$((offset + 1)) file | head -c $length > out` is significantly faster.
**Action:** Use `tail -c | head -c` for high-performance file carving instead of `dd bs=1`.
