## 2024-10-24 - File Carving Performance Optimization
**Learning:** Using `dd bs=1` for extracting data is extremely slow compared to `tail -c +N | head -c M` due to `dd` making a read system call for every single byte when `bs=1` is specified, causing massive system call overhead.
**Action:** Always prefer the `tail | head` pipeline over `dd bs=1` for high-performance file carving in bash scripts.
