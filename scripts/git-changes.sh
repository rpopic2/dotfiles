#!/bin/bash
CWD=$1
if test -z $CWD; then
    CWD=$(pwd)
fi

RESULT=$(git remote get-url origin | cut -d/ -f5)
RESULT=$RESULT/$(git -C $CWD branch --show-current)

if git -C $CWD status | grep -c push; then
    RESULT="$RESULT↑"
fi
if git -C $CWD tatus | grep -c pull; then
    RESULT="$RESULT↓"
fi
if git -C $CWD status | grep -c 'tree clean'; then
    echo $RESULT
    exit
else
    echo "$RESULT*"
fi
