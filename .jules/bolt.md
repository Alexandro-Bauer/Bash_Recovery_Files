## 2026-08-09 - Faster byte-level file carving in bash
**Learning:** `dd bs=1 skip=N count=M` is incredibly slow because it processes the file 1 byte at a time. The GNU extension `dd iflag=skip_bytes` is not portable to BSD/macOS. The pipeline `tail -c +$((start + 1)) "$file" 2>/dev/null | head -c M > "$output"` is highly portable and orders of magnitude faster.
**Action:** When extracting byte ranges in bash scripts, use the `tail | head` pipeline instead of `dd bs=1`. Always check file creation/size (e.g., `[ -s "$file" ]`) instead of pipeline exit code to verify success.
