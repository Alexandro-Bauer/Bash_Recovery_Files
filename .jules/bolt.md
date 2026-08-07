## 2024-08-06 - [File Carving Optimization]
**Learning:** Using `dd bs=1 skip=$offset count=$count` is very slow due to reading the file byte-by-byte (or 1 byte block size). Using `dd iflag=skip_bytes` is fast but GNU-specific and not portable to macOS/BSD. Using `tail -c +$((offset + 1)) | head -c $count` is both highly portable and much faster than `dd bs=1`.
**Action:** Replace `dd bs=1 skip=... count=...` with `tail -c +$((offset + 1)) | head -c $count` for byte-level carving in portable scripts.
