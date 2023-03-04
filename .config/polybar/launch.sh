#!/usr/bin/env bash

# kill polybar if already running
polybar-msg cmd quit
# killall -q polybar

# launch bar
echo "---" | tee -a /tmp/polybar-top.log /tmp/polybar-bot.log
polybar top 2>&1 | tee -a /tmp/polybar-top.log & disown
polybar bottom 2>&1 | tee -a /tmp/polybar-bot.log & disown

echo "polybar launched"
