
## 2024-06-28 - Optimize dd carving with larger block size
**Learning:** Using `dd` with `bs=1` causes extreme overhead due to a read/write syscall for every single byte copied. This makes file extraction extremely slow, especially for larger chunks. The GNU `dd` implementation supports `iflag=skip_bytes,count_bytes` which perfectly maps the original `bs=1` syntax (where skip and count were meant as bytes) while allowing an arbitrarily large block size (e.g. `bs=4M`).
**Action:** When extracting data based on exact byte offsets, never default to `bs=1`. Always use a large block size like `bs=4M` coupled with `iflag=skip_bytes,count_bytes` on Linux/GNU environments for massive performance gains with no logic alterations.
