## 2026-10-23 - [Replace slow dd bs=1 with tail|head pipeline]
**Learning:** Using `dd bs=1` for byte-level file extraction in Bash is extremely slow due to single-byte reads. A pipeline using `tail -c +$((offset + 1)) | head -c $length` is highly portable and performant for file carving operations.
**Action:** Always prefer `tail | head` for carving portions of files in Bash scripts instead of `dd bs=1`, and ensure error handling validates both the pipeline exit code and the resulting file's integrity using `[ $? -eq 0 ] && [ -s "$file" ]`.
