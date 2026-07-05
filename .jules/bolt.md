## 2024-07-05 - Optimize dd Block Size for File Carving

**Learning:** In bash scripts performing file carving, using `dd` with a 1-byte block size (`bs=1`) creates a massive performance bottleneck because every single byte requires a full `read()` and `write()` system call pair.

**Action:** When carving files using `dd` in GNU/Linux environments, always use a large block size (e.g., `bs=4M`) in combination with the GNU extensions `iflag=skip_bytes,count_bytes` to drastically reduce system call overhead while maintaining exact byte-level precision. Note that this optimization is specific to GNU `dd` and is not portable to BSD/macOS.
