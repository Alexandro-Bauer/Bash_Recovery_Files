## 2024-09-20 - dd bs=1 performance trap
**Learning:** Using `dd bs=1 skip=N count=M` for byte-level carving is extremely slow due to single-byte reads.
**Action:** Replace `dd bs=1` with `tail -c +$((N + 1)) file | head -c M > out` for massive performance gains. Ensure proper error and file integrity checking (`[ $? -eq 0 ] && [ -s file ]`).
