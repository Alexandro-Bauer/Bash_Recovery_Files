## 2026-08-30 - dd vs tail|head performance for byte-level carving
**Learning:** Using `dd bs=1 skip=N count=M` for byte-level extraction in bash scripts is a major performance bottleneck due to the per-byte syscall overhead. `tail -c +(N+1) | head -c M` is orders of magnitude faster. `tail` will receive a SIGPIPE when `head` stops reading, which will cause standard error output that can break `set -e` scripts.
**Action:** Replace `dd bs=1` for byte extraction with `tail -c +$((start + 1)) file 2>/dev/null | head -c $count` and safely check `$?` and file size.
