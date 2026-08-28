#!/bin/bash
echo "Creating dummy file of 10MB..."
dd if=/dev/urandom of=dummy.bin bs=1M count=10 2>/dev/null
echo "Testing dd bs=1..."
time { bash -c "dd if=dummy.bin of=out_dd.bin bs=1 skip=5000000 count=1000000 2>/dev/null"; }
echo "Testing tail | head..."
time { bash -c "tail -c +5000001 dummy.bin 2>/dev/null | head -c 1000000 > out_tail.bin"; }
rm -f dummy.bin out_dd.bin out_tail.bin
