## 2024-10-01 - ⚡ Bolt: Replace dd bs=1 with tail | head for faster file carving
**Learning:** Using `dd bs=1` for file carving is extremely slow because it makes a read and write syscall for every single byte. The `tail -c +N | head -c M` pipeline is a highly performant and portable alternative that uses large buffers, vastly reducing overhead.
**Action:** Avoid `dd bs=1` and GNU-specific `dd iflag=skip_bytes` (not portable to BSD/macOS). Instead, use `tail -c +$((start + 1)) "$file" | head -c $count > "$output"`. Note the `+1` since `dd skip` is 0-indexed and `tail -c +N` is 1-indexed.
