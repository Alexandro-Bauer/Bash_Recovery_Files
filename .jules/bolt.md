## 2026-10-09 - [File Carving]
**Learning:** Using `dd bs=1 skip=N count=M` for byte-level file extraction is extremely slow due to single-byte I/O processing overhead.
**Action:** Replace it with the highly portable and performant pipeline `tail -c +$((start + 1)) "$file" 2>/dev/null | head -c $count > "$output"`. Verify pipeline success and resulting file integrity simultaneously with `[ $? -eq 0 ] && [ -s "$output" ]`.
