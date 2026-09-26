## 2024-09-26 - Slow dd command for file carving
**Learning:** `dd bs=1` is extremely slow for carving files and `tail -c | head -c` is significantly faster. `dd bs=1` extracts byte-by-byte causing high system call overhead, whereas `tail | head` is optimized for byte skipping and reading.
**Action:** Replace `dd bs=1 skip=$START count=$LENGTH` with `tail -c +$((START + 1)) 2>/dev/null | head -c $LENGTH` for file carving. Make sure to redirect `tail` stderr to suppress SIGPIPE errors under `set -e`.
