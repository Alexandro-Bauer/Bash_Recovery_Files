## 2024-05-24 - Initial setup
**Learning:** Nothing yet.
**Action:** Let's go!

## 2024-05-24 - Replaced dd bs=1 with tail | head pipeline
**Learning:** Using `dd bs=1` for byte-level extraction in bash scripts is extremely slow due to the 1-byte block size and massive system call overhead.
**Action:** Always replace `dd bs=1` with the highly portable and performant pipeline `tail -c +$((start + 1)) | head -c $count` for byte-level file carving. Make sure to redirect `tail`'s standard error to `/dev/null` to suppress SIGPIPE errors under `set -e`, and update subsequent file existence checks to also check if the file size is greater than 0 (`-s`).
