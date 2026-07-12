## 2024-07-12 - Replace slow dd with tail/head for byte-level extraction
**Learning:** Using `dd bs=1` for byte-level file extraction is extremely slow and causes severe performance bottlenecks during file carving.
**Action:** Replace `dd bs=1 skip=$start count=$len` with the highly portable and performant pipeline `tail -c +$((start + 1)) "$file" | head -c $len > "$output"`.
