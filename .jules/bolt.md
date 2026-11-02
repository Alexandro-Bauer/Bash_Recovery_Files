## 2026-11-02 - [Performance bottleneck] Slow file carving with dd
**Learning:** Using `dd bs=1` for byte-level file carving in shell scripts is extremely slow because it processes one byte at a time. The pipeline `tail -c +$((start + 1)) "$file" | head -c $count > "$output"` is highly portable and performant. The `+1` is necessary because `dd skip=N` is 0-indexed while `tail -c +N` is 1-indexed.
**Action:** Replace slow `dd bs=1` commands with `tail -c +N | head -c M` for file carving and measure performance to confirm.
