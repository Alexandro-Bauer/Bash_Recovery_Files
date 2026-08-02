## 2024-05-14 - File Carving Bottleneck
**Learning:** Using `dd bs=1 skip=N count=M` is incredibly slow for extracting files because it performs single-byte reads/writes.
**Action:** Replace `dd bs=1` with the highly performant and portable pipeline `tail -c +$((start + 1)) "$file" | head -c $count > "$output"`. Note that `tail` is 1-indexed. Use `[ -s "$output" ]` instead of `[ $? -eq 0 ]` to verify success, since the pipe exit code only reflects the last command.
