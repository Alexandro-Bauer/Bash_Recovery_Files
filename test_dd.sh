#!/bin/bash
echo "Creating dummy file..."
head -c 100000000 /dev/urandom > dummy.dd

echo "Testing bs=1"
time dd if=dummy.dd of=out1.dd bs=1 skip=1000 count=50000000 >/dev/null 2>&1

echo "Testing bs=4M with iflag=skip_bytes,count_bytes"
time dd if=dummy.dd of=out2.dd bs=4M iflag=skip_bytes,count_bytes skip=1000 count=50000000 >/dev/null 2>&1

echo "Verifying output"
md5sum out1.dd out2.dd
rm dummy.dd out1.dd out2.dd
