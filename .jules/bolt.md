## 2026-07-10 - File Carving Bottleneck

**Learning:** `dd bs=1` is extremely slow for carving out portions of files because it reads and writes byte-by-byte. Using `tail -c | head -c` performs the exact same operation magnitudes faster while preserving compatibility.

**Action:** Whenever carving exact byte ranges from large files in bash, avoid `dd bs=1` in favor of `tail -c +$((start + 1)) | head -c $count`.
