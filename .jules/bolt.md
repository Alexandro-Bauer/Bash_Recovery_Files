## 2024-05-15 - File Carving Bottleneck
**Learning:** Using `dd bs=1 skip=N` for byte-level carving in Bash scripts is extremely slow because it processes one byte at a time.
**Action:** Use the highly portable and performant pipeline `tail -c +$((start + 1)) "$file" 2>/dev/null | head -c $count > "$output"` to massively speed up byte-level file extractions.
