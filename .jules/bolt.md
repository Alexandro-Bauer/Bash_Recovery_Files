## 2024-07-27 - Pipeline Error Handling with `tail | head`
**Learning:** When using a pipeline like `tail | head > file` to replace `dd`, you cannot rely on `$?` to check for success. If `tail` fails, `head` will still exit successfully (`0`) and output an empty 0-byte file, causing false positives.
**Action:** Always use `[ -s "$file" ]` instead of `[ $? -eq 0 ]` when validating file extraction via pipelines to ensure data was actually written.
