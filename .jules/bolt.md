## 2024-11-23 - Fast file carving
**Learning:** Using `dd bs=1` is a massive performance bottleneck for extracting files byte-by-byte because of system call overhead. A pipeline of `tail -c +N` and `head -c M` is vastly faster.
**Action:** When carving bytes from files, replace `dd bs=1` with `tail -c | head -c` pipeline and check the target output file with `[ -s "$file" ]` to verify success since pipe exit codes can be unreliable.
