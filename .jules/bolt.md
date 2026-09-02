## 2024-05-24 - Avoid `dd bs=1` for byte-level extraction
**Learning:** Using `dd` with `bs=1` for extracting bytes from a file is extremely slow due to single-byte read/write operations overhead.
**Action:** Use `tail -c +$((start + 1)) "$file" | head -c $count` for orders-of-magnitude faster, portable byte-level carving.
