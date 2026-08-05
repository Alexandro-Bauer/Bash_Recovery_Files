## 2026-08-04 - File carving optimization using tail and head
**Learning:** Using `dd bs=1` for byte-level extraction in bash scripts is extremely slow because it forces a system call per byte read.
**Action:** Replace `dd bs=1 skip=$offset count=$len` with the pipeline `tail -c +$((offset + 1)) | head -c $len` to achieve significant performance improvements (orders of magnitude faster on large files) while retaining portability.

## 2026-08-04 - Tail sigpipe handling in strict bash scripts
**Learning:** In bash scripts with `set -e`, `tail` may raise an error and exit when `head` closes the pipe, which stops script execution or prints unwanted error messages.
**Action:** Redirect `tail` stderr to `/dev/null` (e.g., `tail ... 2>/dev/null | head ...`) to gracefully handle SIGPIPE and prevent script termination.
