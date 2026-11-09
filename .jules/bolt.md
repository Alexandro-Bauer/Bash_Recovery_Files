## 2024-11-09 - Massive Performance Hit with dd bs=1 for File Carving
**Learning:** Using `dd bs=1 skip=X count=Y` for byte-level file extraction is extremely slow (O(N) overhead) due to block processing.
**Action:** Replace with `tail -c +$((start + 1)) "$file" 2>/dev/null | head -c $count > "$output"` for nearly instantaneous performance. Verify using `[ -s "$output" ]`.
