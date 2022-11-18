#!/bin/bash
STAT=$(git status | tail -n 1 | awk '{ print $1 }')
if [ "$STAT" != "nothing" ]; then
    echo "*"
fi
