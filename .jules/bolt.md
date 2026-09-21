## 2024-10-09 - Faster Byte-Level File Carving in Bash
**Learning:** Using `dd bs=1 skip=N count=M` is incredibly slow for byte-level extraction in Bash scripts due to the 1-byte block size overhead.
**Action:** Use the highly performant and portable pipeline `tail -c +$((start + 1)) "$file" 2>/dev/null | head -c $count > "$output"` instead. Also, note that `tail -c +N` is 1-indexed, while `dd skip=N` is 0-indexed, so `+1` is necessary. Suppress `tail`'s standard error to prevent unexpected errors when `head` closes the pipe.
