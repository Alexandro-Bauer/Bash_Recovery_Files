## 2026-10-11 - Byte-level File Carving Performance Optimization
**Learning:** Using `dd bs=1 skip=N count=M` for byte-level file extraction is extremely slow due to single-byte I/O operations.
**Action:** Replace `dd bs=1` with the highly performant and portable pipeline `tail -c +$((start + 1)) "$file" 2>/dev/null | head -c $count > "$output"`. Ensure to suppress tail's stderr and verify file integrity with `[ -s "$output" ]`.
