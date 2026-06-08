## 2026-06-08 - Optimization of dd block sizes for file carving
**Learning:** The application was using `dd` with `bs=1` to carve files, which forces the OS to make read/write system calls for every single byte, destroying performance.
**Action:** Replaced `bs=1` with `bs=4M iflag=skip_bytes,count_bytes` to buffer reads in 4MB chunks while retaining exact byte-level precision, dramatically speeding up file extraction.
