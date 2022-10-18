#!/bin/sh

res=0

cd "$(dirname "$0")"
for f in *.test.sh; do
    echo "Running $f"
    bash -euo pipefail "$f" || res=1
done

exit $res
