#!/bin/zsh
# Sets launch commands to be executed when xserver starts

# Disable touchpad while typing
# syndaemon -i 1 -t -K -R -d &

# Hide mouse when not in use
# unclutter &

#$HOME/Scripts/make_local_i3_config
$HOME/Scripts/configure_display

# Preferred Desktop Environment
#exec i3

sxhkd &
exec bspwm
