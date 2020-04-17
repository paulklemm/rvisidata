#!/bin/bash

filename=$1

tmux split-window -vb -p 70 "vd $filename" \; \
  select-pane -l

