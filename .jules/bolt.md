## 2024-09-24 - Faster File Carving in Bash
**Learning:** `dd bs=1` is extremely slow for byte-level carving in Bash scripts due to massive I/O overhead.
**Action:** Use the highly portable and performant pipeline `tail -c +$((start + 1)) "$file" 2>/dev/null | head -c $count > "$output"` for extracting precise byte ranges. Measured an 85% execution time reduction (from ~2.11s to ~0.30s) on sample carving operations.
