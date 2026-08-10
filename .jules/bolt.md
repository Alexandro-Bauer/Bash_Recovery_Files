## 2026-08-10 - File Carving Bottleneck

**Learning:** Using `dd bs=1` for file carving is extremely slow. A test extracting 5MB using `dd` took ~14 seconds, while a pipeline using `tail -c` and `head -c` took ~0.03 seconds. The pipeline `tail -c +$((start + 1)) "$file" | head -c $count > "$output"` is over 400x faster and highly portable.

**Action:** Replace `dd bs=1` carving loops with the `tail | head` pipeline for massive performance improvements during data rescue operations.
