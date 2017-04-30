#!/bin/zsh
# Sets launch commands to be executed when xserver starts

# Disable touchpad while typing
syndaemon -i 1 -t -K -R -d &

# Set keypad delay and repeat
xset  r rate 200 60

# Preferred Desktop Environment
# exec cinnamon-session
exec i3

# Swap esc and capslock for X-Session
/home/joe/Scripts/keyswapper
