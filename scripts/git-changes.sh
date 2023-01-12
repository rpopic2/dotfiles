#!/bin/bash
CWD=$1
if test -z $CWD; then
    CWD=$(pwd)
fi

RESULT=$(git -C $CWD remote get-url origin | cut -d/ -f5 | cut -d. -f1)
RESULT=$RESULT/$(git -C $CWD branch --show-current)

if git -C $CWD status | grep -c 'git push'; then
    RESULT="↑$RESULT"
fi
if git -C $CWD status | grep -c 'git pull'; then
    RESULT="↓$RESULT"
fi
if git -C $CWD status | grep -c 'tree clean'; then
    echo $RESULT
    exit
else
    echo "*$RESULT"
fi
