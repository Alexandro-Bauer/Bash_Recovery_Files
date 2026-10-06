## 2025-02-14 - Replace dd bs=1 with tail -c | head -c for file carving
**Learning:** Using `dd bs=1` for byte-level file carving is extremely slow due to the 1-byte block size overhead. GNU `dd iflag=skip_bytes` is faster but not portable.
**Action:** Use the highly portable and performant pipeline `tail -c +$((start + 1)) "$file" 2>/dev/null | head -c $count > "$output"` for byte-level extraction in shell scripts.
