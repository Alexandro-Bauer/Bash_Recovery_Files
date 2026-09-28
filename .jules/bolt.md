## 2024-05-15 - Fast byte-level file extraction in Bash
**Learning:** Using `dd bs=1 skip=... count=...` in bash scripts for carving small chunks from files is extremely slow due to single-byte I/O processing overhead. A `tail -c +$((start + 1)) file | head -c $count` pipeline provides massive performance gains for byte-level carving without external dependencies.
**Action:** When implementing file carving or byte-level extraction in Bash, avoid `dd bs=1` and instead use the `tail | head` pipeline with `2>/dev/null` on `tail` to suppress SIGPIPE errors under `set -e`.
