## 2024-11-11 - Optimize byte-level file carving
**Learning:** Using `dd bs=1` with `skip` for byte-level file carving in bash scripts is a major performance bottleneck due to excessive I/O overhead. The GNU-specific `iflag=skip_bytes` is faster but not portable.
**Action:** Use the highly portable and performant pipeline `tail -c +$((start + 1)) "$file" 2>/dev/null | head -c $count > "$output"` for extracting data blocks, and verify extraction success with `[ -s "$output" ]`.
