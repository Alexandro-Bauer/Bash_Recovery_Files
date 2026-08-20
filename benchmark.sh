#!/bin/bash
dd if=/dev/zero of=dummy.dd bs=1M count=10 >/dev/null 2>&1
echo "Benchmarking dd bs=1..."
time { dd if=dummy.dd of=out1.dd bs=1 skip=1048576 count=524288 status=none; }
echo "Benchmarking tail | head..."
time { tail -c +$((1048576 + 1)) dummy.dd | head -c 524288 > out2.dd; }
rm dummy.dd out1.dd out2.dd
