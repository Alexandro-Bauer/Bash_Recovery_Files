## 2024-05-24 - Initializing Bolt Journal
**Learning:** Establishing the journal to track performance optimizations and learnings.
**Action:** Always document critical findings here.
## 2026-09-07 - Replaced dd with tail|head for file carving
**Learning:** In Bash scripts handling binary file carving, `dd bs=1 skip=X count=Y` is extremely slow because it processes the file byte-by-byte using 1-byte read/write system calls.
**Action:** Replace `dd bs=1` with `tail -c +$((start + 1)) file | head -c $count` which uses much larger buffers and stream processing, significantly reducing overhead for extraction without sacrificing accuracy. Note: `tail -c` is 1-indexed so we add 1 to the offset.
