## 2026-05-24 - [File Carving Optimization]
**Learning:** Using `dd bs=1 skip=X count=Y` for file carving creates an immense system call bottleneck due to single-byte block processing.
**Action:** Always use a larger block size (e.g. `bs=4M`) combined with `iflag=skip_bytes,count_bytes` for byte-level precision while maintaining fast copy speeds.
