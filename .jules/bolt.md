## 2024-08-04 - Byte-level file carving in shell scripts
**Learning:** Using `dd bs=1` for byte-level extraction in bash is extremely slow due to single-byte I/O operations.
**Action:** Replace `dd bs=1 skip=N count=M` with the highly portable and performant pipeline `tail -c +$((N + 1)) "$file" 2>/dev/null | head -c M > "$output"`. Note that `tail` is 1-indexed (needs +1) and 2>/dev/null suppresses SIGPIPE errors.
