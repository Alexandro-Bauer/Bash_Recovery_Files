## 2026-05-29 - [Massive performance bottleneck in 'dd' commands]
**Learning:** [Using 'bs=1' (block size of 1 byte) forces the OS to perform a read and write system call for every single byte, leading to exponentially slow operations]
**Action:** [Use 'bs=4M iflag=skip_bytes,count_bytes' instead, which maintains exact byte-level precision while batching the reads/writes into large chunks, drastically reducing overhead]
