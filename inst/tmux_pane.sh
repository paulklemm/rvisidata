#!/bin/bash

filename=$1

tmux split-window -vb -p 70 \; \
  send-keys "vd $filename" C-m \; \
  select-pane -l

