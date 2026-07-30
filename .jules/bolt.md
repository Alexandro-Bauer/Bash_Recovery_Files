## 2026-07-30 - Bash Pipeline Exit Codes and File Integrity

**Learning:** When validating the success of a command pipeline that writes to a file (like `tail | head > file`), the standard exit code check (`[ $? -eq 0 ]`) is unreliable in Bash without `set -o pipefail`. If an earlier command fails, the final command (e.g., `head`) might still succeed, masking the error.
**Action:** Instead of relying on `$?`, always verify the integrity of the generated output by checking if the file exists and is non-empty using `[ -s "$file" ]`.
