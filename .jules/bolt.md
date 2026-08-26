## 2024-05-18 - Fast File Carving
**Learning:** `dd bs=1 skip=X count=Y` is extremely slow for carving files out of an image, because it reads byte-by-byte. For a 4MB file, it takes ~11 seconds, compared to 0.018 seconds for `tail -c +$((X + 1)) | head -c Y`.
**Action:** Replace `dd bs=1` with `tail -c +$((START + 1)) | head -c $COUNT > output` for file carving operations to drastically improve performance.
