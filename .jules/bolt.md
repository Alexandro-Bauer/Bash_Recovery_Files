## 2024-11-06 - Byte-Level File Carving Bottleneck
**Learning:** Using `dd bs=1` for file extraction is extremely slow and acts as a major performance bottleneck for large files.
**Action:** Replace `dd bs=1 skip=N count=M` with the highly portable and performant pipeline `tail -c +$((N + 1)) file 2>/dev/null | head -c M > output`.
