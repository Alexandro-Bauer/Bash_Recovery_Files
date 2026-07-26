## 2025-02-18 - Replacing `dd bs=1` for File Carving
**Learning:** `dd bs=1` is excruciatingly slow because it performs discrete `read()` and `write()` system calls for every single byte copied. This causes massive CPU overhead and I/O wait times.
**Action:** When performing byte-level file carving in shell scripts, avoid `dd bs=1` and instead use the highly portable pipeline `tail -c +$((start + 1)) "$file" | head -c $count > "$output"`. The `+1` is necessary because `tail -c` is 1-indexed. This relies on utility default buffer sizes, reducing system calls and dramatically improving speed.
