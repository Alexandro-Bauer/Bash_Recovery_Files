## 2026-07-19 - [Faster Byte-Level Carving]
**Learning:** dd with bs=1 is extremely slow because it requires one read and one write system call per byte. The pipeline tail -c +$((start + 1)) | head -c $count is significantly faster and highly portable.
**Action:** Use tail | head instead of dd bs=1 for byte-level carving in shell scripts.
