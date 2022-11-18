#!/bin/bash
RESULT=""
if git status | grep -c push; then
    RESULT="$RESULT↑"
fi
if git status | grep -c pull; then
    RESULT="$RESULT↓"
fi
if git status | grep -c 'tree clean'; then
    echo $RESULT
    exit
fi
echo "$RESULT*"
