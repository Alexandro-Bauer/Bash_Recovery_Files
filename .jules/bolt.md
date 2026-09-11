## 2024-09-10 - File Carving Performance
**Learning:** Using `dd bs=1` for byte-level extraction is extremely slow.
**Action:** Replace it with the highly portable and performant pipeline `tail -c +$((start + 1)) "$file" 2>/dev/null | head -c $count > "$output"`. Verify extraction success using `[ $? -eq 0 ] && [ -s "$output" ]`.
