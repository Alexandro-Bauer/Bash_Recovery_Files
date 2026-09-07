## 2024-09-07 - File Carving Bottleneck
**Learning:** Using `dd` with `bs=1` for byte-level extraction in bash scripts causes extreme performance degradation due to the OS making read/write system calls for every single byte.
**Action:** Replace `dd bs=1 skip=X count=Y` with a buffered pipeline `tail -c +$((X + 1)) | head -c Y`. Ensure validation checks account for potential pipe closure edge cases by verifying the exit code and validating output file sizes with `[ -s "$file" ]`.
