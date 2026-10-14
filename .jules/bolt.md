## 2024-06-25 - File carving optimization
**Learning:** Using `dd bs=1 skip=N count=M` for extracting small segments of files byte-by-byte is extremely slow due to the overhead of reading 1 byte at a time.
**Action:** Use the `tail -c +$((N + 1)) | head -c $M` pipeline instead. It's portable (avoids GNU-specific `iflag=skip_bytes`) and drastically improves file carving throughput.
