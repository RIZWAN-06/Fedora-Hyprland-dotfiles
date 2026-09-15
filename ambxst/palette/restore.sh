#!/bin/bash
# Restore Catppuccin Mocha palette to Ambxst cache
sleep 2 # Wait for matugen to run first
cp ~/.config/ambxst/palette/catppuccin-mocha.json ~/.cache/ambxst/colors.json
pkill -SIGUSR1 quickshell 2>/dev/null
