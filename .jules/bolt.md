## 2024-10-24 - [Replace dd with tail|head for File Carving]
**Learning:** Using `dd bs=1` for extracting bytes at arbitrary offsets is extremely slow because it performs unbuffered, 1-byte read/write operations, drastically slowing down processing of large files.
**Action:** Use a block-buffered stream pipeline like `tail -c +$((start + 1)) "$file" 2>/dev/null | head -c $length > "$output"` for byte-level carving. Make sure to check file size (`[ -s "$file" ]`) as `head` will successfully create an empty file if the pipe fails.
