## 2024-08-28 - Optimize byte-level carving performance
**Learning:** `dd bs=1 skip=N` is incredibly slow for extracting large chunks of bytes because it processes the file byte-by-byte. A pipeline of `tail -c +N` and `head -c` is significantly faster and uses standard GNU tools. The offset for `tail` must be +1 compared to `dd skip` because `tail` is 1-indexed, while `dd skip` is 0-indexed.
**Action:** Always prefer `tail -c +N | head -c` over `dd bs=1` for byte-level carving in bash scripts to improve performance by multiple orders of magnitude.
