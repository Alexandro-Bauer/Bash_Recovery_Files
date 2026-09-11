## 2026-09-11 - Optimize Byte-level File Carving
**Learning:** `dd bs=1` and `dd iflag=skip_bytes` are too slow or non-portable for byte-level extraction in Bash scripts.
**Action:** Use the highly portable and performant pipeline `tail -c +$((start + 1)) "$file" | head -c $count > "$output"` for byte-level carving. Make sure to silence `tail` standard error to avoid SIGPIPE noise.
