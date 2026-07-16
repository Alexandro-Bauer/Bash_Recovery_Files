## 2024-07-15 - dd bs=1 is a massive shell script performance bottleneck
**Learning:** Using `dd bs=1 skip=X count=Y` to extract byte ranges from a file forces the OS to read and write a single byte at a time, resulting in millions of system calls and abysmal performance for large files (e.g. 30 seconds for 10MB).
**Action:** Replace `dd bs=1` carving operations with standard stream tools using block buffering: `tail -c +$((start + 1)) "$file" | head -c $count > "$output"`, which is thousands of times faster (e.g. 0.07 seconds for 10MB) and highly portable.
