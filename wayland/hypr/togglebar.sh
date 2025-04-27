#!/bin/sh

if pgrep "waybar" > /dev/null; then
    pkill -9 waybar
else
    waybar &
fi
