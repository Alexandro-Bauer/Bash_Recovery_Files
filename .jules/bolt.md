## 2024-07-23 - File Carving Bottleneck

**Learning:** When using `dd bs=1` for file carving in shell scripts, the performance is heavily bottlenecked by system calls (1 byte per read/write loop). This can make file extraction extraordinarily slow for large files.

**Action:** Replace `dd bs=1 skip=N count=N` with the standard and highly performant pipeline `tail -c +$((N + 1)) file | head -c N` to leverage block I/O. Remember that `tail -c +N` is 1-indexed.
