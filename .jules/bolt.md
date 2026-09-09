## 2023-10-10 - File Carving Bottleneck
**Learning:** For byte-level file carving in shell scripts, `dd bs=1` is extremely slow due to single-byte read/write overhead. GNU-specific `dd iflag=skip_bytes` is not portable.
**Action:** Use the highly portable and performant pipeline `tail -c +$((start + 1)) "$file" 2>/dev/null | head -c $count > "$output"` for a massive speedup. Ensure both pipeline exit code and output file integrity (`[ -s "$file" ]`) are verified to avoid regressions.
