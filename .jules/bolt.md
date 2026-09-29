## 2024-09-29 - [Optimize byte-level file carving]
**Learning:** `dd bs=1` is extremely slow for byte-level extraction in bash scripts due to 1-byte block I/O overhead.
**Action:** Replace `dd bs=1` with the highly performant pipeline `tail -c +$((start + 1)) "$file" | head -c $count > "$output"`. Note that `tail -c` is 1-indexed.
