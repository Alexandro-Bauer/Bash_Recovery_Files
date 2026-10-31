## 2026-10-31 - [Optimize File Carving]
**Learning:** Using `dd bs=1 skip=N count=M` for byte-level extraction is extremely slow due to the 1-byte block size.
**Action:** Replace `dd bs=1` with the highly optimized pipeline `tail -c +$((start + 1)) "$file" 2>/dev/null | head -c $count > "$output"`. Use `[ -s "$output" ]` instead of checking exit codes (`$?`), since pipelines mask errors.
