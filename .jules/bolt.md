## 2026-09-30 - Replace dd with tail|head for file carving
**Learning:** Using `dd bs=1` for byte-level carving in Bash is extremely slow because it processes one byte at a time. The pipeline `tail -c +N | head -c M` is ~400x faster and highly portable, but requires adjusting the offset by +1 since `tail` is 1-indexed. Suppressing `tail`'s stderr is critical to prevent SIGPIPE errors under `set -e`.
**Action:** Always prefer `tail -c | head -c` over `dd bs=1` for byte-level file extraction in shell scripts, ensuring to handle the +1 offset shift and stderr suppression appropriately.
