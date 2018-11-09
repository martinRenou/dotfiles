#!/usr/bin/env bash

sleep 1

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

rm /tmp/ipc-bottom

# Launch bars
polybar bottom &
ln -s /tmp/polybar_mqueue.$! /tmp/ipc-bottom

/usr/bin/python3 /home/martin/.config/polybar/spotify/py_spotify_listener.py &
