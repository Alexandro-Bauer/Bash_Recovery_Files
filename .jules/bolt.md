## 2024-07-29 - Replace dd bs=1 with tail/head
**Learning:** Using dd bs=1 for byte-level extraction in bash is extremely slow. Replaced with tail -c | head -c pipeline for a huge speedup. Batching exiftool avoids process startup overhead.
**Action:** Use tail | head instead of dd for byte-level extraction.
