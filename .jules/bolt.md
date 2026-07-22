## 2026-07-22 - Replacing unbuffered `dd` with `tail|head`
**Learning:** `dd bs=1` is excruciatingly slow for file carving because it forces unbuffered 1-byte read/write system calls. Replacing it with `tail -c +N | head -c M` uses standard coreutils buffering (typically 4K to 64K chunks), resulting in orders-of-magnitude faster processing.
**Action:** Always avoid `dd bs=1` for any real file I/O operations. Default to `tail | head` for portable byte-level carving in bash scripts.
