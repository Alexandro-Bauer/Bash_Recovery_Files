## 2024-10-10 - Replace dd bs=1 with tail | head pipeline
**Learning:** Using `dd bs=1` for file carving is extremely slow due to single-byte I/O operations.
**Action:** Use the `tail -c +N | head -c M` pipeline for highly performant, portable byte-level file extractions in shell scripts. The +1 offset is necessary because `dd skip=N` is 0-indexed while `tail -c +N` is 1-indexed. Ensure error output of `tail` is suppressed and verify successful extraction by checking both exit code and file size `[ -s "$file" ]`.
