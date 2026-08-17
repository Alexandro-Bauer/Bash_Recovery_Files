## 2024-05-18 - Optimize byte-level file carving performance
**Learning:** In bash file-carving operations, `dd bs=1` is extremely slow. Using a `tail -c | head -c` pipeline provides massive performance gains for large byte extractions.
**Action:** Whenever carving files at specific byte offsets, avoid `dd bs=1` and instead use `tail -c +$((offset + 1)) "$file" 2>/dev/null | head -c $count > "$output"`.
