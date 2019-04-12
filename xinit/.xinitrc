#!/bin/zsh
# Sets launch commands to be executed when xserver starts

# Disable touchpad while typing
syndaemon -i 1 -t -K -R -d &

# Set keypad delay and repeat
xset  r rate 200 60

# Preferred Desktop Environment
$HOME/Scripts/make_local_i3_config

exec i3
