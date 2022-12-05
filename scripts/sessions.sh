#!/bin/bash
SC=$(tmux ls | tail -n1)
SC=${SC:0:1}
echo $SC
