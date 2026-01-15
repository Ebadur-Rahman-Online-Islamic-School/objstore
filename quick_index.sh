#!/bin/sh

failexit() { echo 'invalid arguments or missing resource' ; exit 1; }

test -n "$1" || failexit
test -d "$1" || failexit

{
cd "$1" && find . -mindepth 1 -maxdepth 1 -print \
 | sed 's|^\./||' \
 | sort -V \
 | jq -R . \
 | jq -s .
}
# -name '*.opus'
