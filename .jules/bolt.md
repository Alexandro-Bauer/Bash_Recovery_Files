## 2024-07-31 - Replace dd bs=1 with tail|head for file carving
**Learning:** Using `dd bs=1 skip=N count=N` is extremely slow for byte-level carving due to byte-by-byte I/O overhead in Bash, while `tail -c +$((N+1)) | head -c N` uses buffered I/O and is orders of magnitude faster.
**Action:** Always prefer `tail -c | head -c` over `dd bs=1` for byte-level extraction in Bash scripts.
