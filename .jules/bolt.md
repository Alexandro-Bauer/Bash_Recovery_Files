## 2024-10-20 - Byte-by-byte extraction optimization
**Learning:** `dd bs=1` is notoriously slow for byte-level carving in Bash scripts due to excessive I/O overhead.
**Action:** Replace `dd bs=1 skip=X count=Y` with `tail -c +$((X + 1)) | head -c Y` which provides significantly better throughput for extracting segments.
