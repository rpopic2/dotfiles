#!/bin/bash
STATUS=$(git status)
RESULT=""
if [ -z $($STAT | grep 'tree clean')]; then
    RESULT="*"
fi
if git status | grep -c push; then
    RESULT="$RESULT↑"
fi
if git status | grep -c pull; then
    RESULT="$RESULT↓"
fi
echo $RESULT
