## 2026-09-24 - Replace slow dd with tail/head pipeline for file carving
**Learning:** `dd bs=1 skip=X count=Y` is extremely slow for byte-level extraction due to processing 1 byte at a time. The pipeline `tail -c +$((X + 1)) | head -c Y` is significantly faster.
**Action:** Replace `dd` with `tail | head` for carving operations, ensuring error handling checks `[ -s "$RecoveredFilePath" ]` to handle pipeline failures or zero-byte extractions safely.
