## 2026-10-03 - File carving performance optimization
**Learning:** Using `dd bs=1 skip=N` for byte-level extraction is extremely slow due to single-byte I/O operations. The pipeline `tail -c +N | head -c M` is vastly more performant and portable.
**Action:** Always prefer `tail | head` for byte-range extraction in shell scripts over `dd bs=1`. Ensure error handling checks `$?` and `[ -s "$file" ]` since pipeline exit codes differ.
