#!/bin/bash

filename=$1

kitty @ launch --type=tab --tab-title "rvisidata" sh -c "vd $filename"
