## 2026-08-21 - Replace slow dd with tail|head
**Learning:** Using `dd bs=1` for byte-level file extraction is extremely slow.
**Action:** Replace `dd bs=1 skip=$N count=$M` with `tail -c +$((N + 1)) | head -c $M` which is highly portable and performant for file carving operations.
