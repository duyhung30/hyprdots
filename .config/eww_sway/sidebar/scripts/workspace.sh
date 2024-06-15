#!/bin/bash

$HOME/.config/eww_sway/sidebar/scripts/workspace.py
while [ 1 == 1 ] ; do
    swaymsg -t subscribe '["workspace"]' > /dev/null
    $HOME/.config/eww_sway/sidebar/scripts/workspace.py
done
