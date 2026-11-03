
## 2024-11-03 - [Fast File Carving]
**Learning:** `dd bs=1` is a severe performance bottleneck for file carving due to per-byte syscalls.
**Action:** Used `tail -c +$((start + 1)) "$file" 2>/dev/null | head -c $count > "$output"` pipeline instead for drastically improved throughput and checked file integrity with `[ -s "$file" ]`.
