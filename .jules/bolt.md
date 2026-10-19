## 2026-10-19 - [Optimize byte-level file carving]
**Learning:** For byte-level file carving in shell scripts, `dd bs=1` is extremely slow and `dd iflag=skip_bytes` is GNU-specific (not portable to BSD/macOS). The highly portable and performant pipeline `tail -c +$((start + 1)) "$file" | head -c $count > "$output"` is roughly 100x faster. Note the `+1` because `dd skip=N` is 0-indexed while `tail -c +N` is 1-indexed.
**Action:** Replace `dd bs=1` operations with `tail -c +N | head -c M` pipelines, suppressing stderr on `tail` to avoid SIGPIPE noise.
