## 2024-10-18 - Optimized file carving throughput
**Learning:** In bash scripts, byte-level file carving using `dd bs=1 skip=N count=M` is incredibly slow because it reads byte-by-byte. For massive throughput improvements, `tail -c +$((N + 1)) file | head -c M` is far more efficient, though `tail` requires its stderr redirected to prevent SIGPIPE errors under `set -e`.
**Action:** Always replace byte-level `dd` operations with a `tail -c | head -c` pipeline, ensuring `tail` index is +1 and verifying output file integrity with `[ -s file ]` instead of just `[ -f file ]`.
