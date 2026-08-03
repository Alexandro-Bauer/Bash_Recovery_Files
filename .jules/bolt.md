## 2024-05-15 - Replace dd with tail and head for byte carving
**Learning:** Using `dd bs=1` for byte-level extraction in shell scripts is extremely slow because it forces exactly one-byte reads and writes, accumulating massive sys time overhead.
**Action:** Replace `dd bs=1 skip=N count=M` with the POSIX-compliant pipeline `tail -c +$((N + 1)) "$file" | head -c M > "$output"`. Note `tail` requires 1-indexing (`+1`) unlike 0-indexed `dd skip`.
