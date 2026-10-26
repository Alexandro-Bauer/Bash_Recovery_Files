## 2023-10-26 - [File Carving Optimization]
**Learning:** `dd bs=1` is extremely slow (O(N) operation) because it reads byte-by-byte, causing excessive I/O overhead. This can take orders of magnitude longer for large extractions compared to alternatives.
**Action:** Replace `dd bs=1 skip=N count=M` with the highly performant pipeline `tail -c +$((N + 1)) "$file" 2>/dev/null | head -c M > "$output"`. Note that `tail -c +K` is 1-indexed, so `N+1` is required. Use `[ -s "$output" ]` instead of `$?` to verify the resulting file integrity.
