#!/bin/bash
set -e
echo "x" > onlyme.txt
chmod 600 onlyme.txt
perm=$(stat -c "%a" onlyme.txt)
[ "$perm" = "600" ] && echo "OK: onlyme.txt is 600" || { echo "FAIL: $perm"; exit 1; }

mkdir -p myprivate
chmod 700 myprivate
perm2=$(stat -c "%a" myprivate)
[ "$perm2" = "700" ] && echo "OK: myprivate is 700" || { echo "FAIL: $perm2"; exit 1; }

echo "All checks passed."
