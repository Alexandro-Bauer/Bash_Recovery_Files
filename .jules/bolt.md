## 2024-05-24 - Replacing dd with tail|head for fast byte-level file carving
**Learning:** Using `dd bs=1` for byte-level extraction in bash scripts is extremely slow due to single-byte I/O overhead.
**Action:** Replace `dd bs=1 skip=X count=Y` with `tail -c +$((X+1)) file 2>/dev/null | head -c Y > out` and verify integrity with `[ -s "$file" ]` instead of `$?` or `[ -f "$file" ]`.
