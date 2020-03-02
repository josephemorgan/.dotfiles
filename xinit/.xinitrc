#!/bin/zsh
# Sets launch commands to be executed when xserver starts

# Disable touchpad while typing
syndaemon -i 1 -t -K -R -d &

# Set keypad delay and repeat
xset  r rate 200 60

# Hide mouse when not in use
unclutter &

# Preferred Desktop Environment
$HOME/Scripts/make_local_i3_config
