## 2024-08-20 - Fast Byte-Level Carving with tail and head
**Learning:** `dd bs=1` is extremely slow for carving files from offsets because it reads byte-by-byte. `tail -c` combined with `head -c` is significantly faster due to better buffering, but `tail` uses 1-based indexing so `skip` must be offset by +1. Additionally, pipe status should be verified using file size checks `[ -s file ]` instead of just `$?`.
**Action:** Always prefer `tail -c +$((skip + 1)) | head -c count > out` over `dd bs=1 skip=... count=...` for performance when extracting byte ranges from files in bash scripts.
