
## 2024-05-15 - [File Carving Performance]
**Learning:** Using `dd bs=1` for byte-level file extraction is extremely slow due to single-byte I/O overhead.
**Action:** Replaced `dd bs=1 skip=N count=M` with the highly performant pipeline `tail -c +$((N + 1)) "$file" 2>/dev/null | head -c M > "$output"`, checking `[ -s "$output" ]` instead of `$?` since `tail` may get SIGPIPE when `head` finishes reading.
