## 2024-05-24 - [Avoid dd bs=1 for byte carving]
**Learning:** Using `dd bs=1` for byte-level file extraction is extremely slow due to the 1-byte block size overhead. The pipeline `tail -c +N | head -c M` is significantly faster and more portable than GNU `dd iflag=skip_bytes`.
**Action:** Always replace `dd bs=1 skip=X count=Y` with `tail -c +$((X + 1)) file 2>/dev/null | head -c Y > out`. Remember to update existence checks to use `[ -s "$file" ]` to fail on zero-byte output.
