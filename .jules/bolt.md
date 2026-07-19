## 2026-07-19 - Blocked git reset command
**Learning:** The `git reset` command is blocked in the run_in_bash_session tool and will cause errors.
**Action:** Use alternatives like `git restore --staged <file>`, `git rm --cached <file>`, or `git checkout -- <file>` to handle staging and working directory modifications.
