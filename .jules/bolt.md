## 2026-09-14 - [Optimize Byte-Level File Carving]
**Learning:** `dd bs=1 skip=$N count=$M` is extremely slow for carving out portions of files because it reads and processes the file byte-by-byte in user-space, incurring massive syscall overhead.
**Action:** Replace `dd bs=1` with a `tail -c +$((N + 1)) "$file" 2>/dev/null | head -c $M > "$output"` pipeline, which uses larger block sizes internally and is orders of magnitude faster. Suppress `tail` stderr to prevent SIGPIPE errors under `set -e`. Also replace `[ -f file ]` with `[ -s file ]` to verify output integrity.
