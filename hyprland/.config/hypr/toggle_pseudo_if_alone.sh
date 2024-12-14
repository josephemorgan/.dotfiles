#!/bin/bash

windows_count=$(hyprctl activeworkspace | grep -oP '(?<=windows: )\d+')

notify-send "$windows_count"

if [ "$windows_count" -eq 0 ]; then
  hyprctl dispatch exec kitty
  sleep 0.2
  hyprctl dispatch setfloating
  sleep 0.1
  hyprctl dispatch resizeactive exact 60% 90%
  sleep 0.1
  hyprctl dispatch centerwindow 
else
  hyprctl dispatch exec kitty
fi

