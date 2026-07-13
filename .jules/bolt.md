## 2024-05-19 - Fast File Carving using tail/head over dd bs=1
**Learning:** `dd bs=1 skip=N count=M` is incredibly slow for carving files from large disk images because it performs reads/writes byte-by-byte. `tail -c +N | head -c M` uses standard buffered I/O, achieving vastly superior throughput. GNU `dd iflag=skip_bytes` solves this but isn't strictly POSIX/Mac compatible.
**Action:** Always prefer `tail -c +$((start + 1)) | head -c $count` over `dd bs=1` for file slicing in bash scripts where maximum portability and speed are required.
