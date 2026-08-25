## 2024-05-24 - File Carving Performance
**Learning:** `dd bs=1 skip=$START count=$COUNT` is incredibly slow for byte-level carving in shell scripts due to processing 1 byte at a time.
**Action:** Use `tail -c +$((start + 1)) "$file" | head -c $count > "$output"` for vastly superior performance without relying on GNU `dd iflag=skip_bytes`.
