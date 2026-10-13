## 2024-10-13 - Optimize file carving speed
**Learning:** For byte-level file carving in shell scripts, `dd bs=1` is extremely slow due to the 1-byte block size overhead.
**Action:** Use the highly portable and performant pipeline `tail -c +$((start + 1)) "$file" | head -c $count > "$output"`. Remember `tail` is 1-indexed so add 1 to the 0-indexed offset.
