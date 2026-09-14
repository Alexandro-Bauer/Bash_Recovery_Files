## 2024-05-24 - Faster File Carving in Bash
**Learning:** Using `dd bs=1 skip=N count=M` for byte-level file extraction is extremely slow. A pipeline using `tail -c +$((N + 1)) file | head -c M > out` is significantly faster and more efficient for shell scripts.
**Action:** Always prefer the `tail | head` pipeline over `dd bs=1` for file carving operations in Bash scripts to improve performance.
