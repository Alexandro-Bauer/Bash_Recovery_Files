## 2024-05-24 - [Avoid dd bs=1 for File Carving]
**Learning:** `dd bs=1` is a severe performance bottleneck for byte-level extraction in shell scripts because it reads/writes exactly one byte at a time.
**Action:** Use the highly portable pipeline `tail -c +$((start + 1)) "$file" | head -c $count > "$output"` for vastly superior performance. The `+1` is crucial as `tail -c` is 1-indexed, while `dd skip=` is 0-indexed.
