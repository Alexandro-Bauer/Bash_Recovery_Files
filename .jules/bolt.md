## 2024-05-24 - [File Carving Optimization]
**Learning:** Using `dd bs=1 skip=N count=M` for byte-level file extraction in shell scripts is extremely slow due to single-byte I/O processing overhead.
**Action:** Replace `dd bs=1` with the highly performant pipeline `tail -c +$((N + 1)) file 2>/dev/null | head -c M > output` and verify its success with `[ $? -eq 0 ] && [ -s "$output" ]`.
