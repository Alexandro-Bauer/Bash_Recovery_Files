## 2024-07-01 - Optimizing dd Block Size
**Learning:** Using `dd bs=1` for file carving creates an immense amount of I/O overhead due to system calls per byte, making it practically unusable for recovering large files from images.
**Action:** Always use a larger block size (e.g., `bs=4M`) coupled with `iflag=skip_bytes,count_bytes` on GNU/Linux systems to minimize overhead while maintaining exact byte-level offset precision during file recovery operations.
