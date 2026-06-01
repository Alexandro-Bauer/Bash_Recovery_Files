## 2026-06-01 - Optimizing byte-level file extraction with dd
**Learning:** Using `bs=1` with `dd` for exact byte offset file extraction incurs massive system call overhead (one read/write call per byte). Replacing it with a large block size (`bs=4M`) paired with `iflag=skip_bytes,count_bytes` maintains exact byte-level precision while dramatically reducing the number of system calls, resulting in vastly faster extraction operations.
**Action:** Always prefer large block sizes and byte-level flags in GNU `dd` for performance-critical byte-level carving.
