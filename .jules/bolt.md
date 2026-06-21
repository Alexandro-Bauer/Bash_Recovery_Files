## 2024-06-11 - [Massive sys call overhead when using bs=1 in dd]
**Learning:** Using `bs=1` in Linux `dd` command causes massive system call overhead because it reads and writes byte-by-byte. For a 5MB payload, `bs=1` takes ~16 seconds compared to ~0.04 seconds when using a block size.
**Action:** When carving/extracting with exact byte offsets, never use `bs=1`. Instead, use a larger block size (e.g., `bs=4M`) in combination with `iflag=skip_bytes,count_bytes` to maintain byte-level precision while executing magnitudes faster by avoiding millions of syscalls.
