## 2024-05-24 - File Carving Optimization
**Learning:** Using `dd bs=1 skip=N count=M` for byte-level file extraction in Bash is extremely slow due to single-byte I/O operations. This creates a massive performance bottleneck when carving large or numerous files from disk images.
**Action:** Replaced `dd bs=1` with the pipeline `tail -c +$((start + 1)) "$file" | head -c $count > "$output"`. This leverages optimized block reads in coreutils, providing orders-of-magnitude faster byte-level carving while remaining portable.
