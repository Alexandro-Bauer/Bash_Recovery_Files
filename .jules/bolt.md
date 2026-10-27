## 2024-10-27 - [Optimize byte-level extraction with tail and head]
**Learning:** `dd bs=1` for byte-level extraction in bash is a major performance bottleneck due to the one-byte-at-a-time read/write system calls.
**Action:** Use the portable pipeline `tail -c +$((START + 1)) file | head -c COUNT` for order-of-magnitude faster byte-level extractions. Remember to handle zero-byte output validations with `[ -s "$output" ]`.
