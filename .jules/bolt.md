## 2024-05-18 - [Replace dd with tail|head for file carving]
**Learning:** Using `dd bs=1` for byte-level file carving in shell scripts is extremely slow due to the 1-byte block size causing immense overhead.
**Action:** Replace `dd bs=1 skip=$start count=$length` with `tail -c +$((start + 1)) "$file" 2>/dev/null | head -c "$length"`. The `+1` is necessary because `dd skip=N` is 0-indexed while `tail -c +N` is 1-indexed. This provides massive performance gains for large files.
