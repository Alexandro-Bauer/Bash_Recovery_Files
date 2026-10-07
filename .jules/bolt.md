## 2025-01-20 - Byte-level file carving optimization
**Learning:** Using `dd bs=1 skip=N count=M` for byte-level extraction in bash is extremely slow due to the 1-byte block size.
**Action:** Use the portable and highly performant pipeline `tail -c +$((N + 1)) "$file" 2>/dev/null | head -c $M > "$output"` instead. Note that `tail` is 1-indexed so `N + 1` is required. Also check the output file size (`[ -s "$output" ]`) to ensure integrity.
