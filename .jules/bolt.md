## 2026-11-04 - Faster File Carving in Bash
**Learning:** Using `dd bs=1 skip=N count=M` for byte-level file extraction is extremely slow due to single-byte I/O operations.
**Action:** Replace it with the highly portable pipeline `tail -c +$((N + 1)) input_file 2>/dev/null | head -c M > output_file` for significantly better performance. Use `[ -s output_file ]` instead of `$?` to verify the extraction, as `$?` only checks the last pipeline command (`head`).
