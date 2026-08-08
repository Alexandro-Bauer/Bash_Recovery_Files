## 2024-08-08 - Fast file carving
**Learning:** `dd bs=1 skip=N count=M` is incredibly slow for byte-level file carving compared to a `tail -c +N | head -c M` pipeline.
**Action:** Use `tail -c +$((N + 1)) "$file" 2>/dev/null | head -c M > "$output"` for byte-accurate extraction without performance overhead.
