#!/bin/bash
EWW_BIN="$(which eww) -c $HOME/.config/eww_sway/sidebar"

$HOME/.config/eww_sway/sidebar/scripts/icon.py
while [ 1 == 1 ] ; do
    swaymsg -t subscribe '["window", "workspace"]' > /dev/null
    # focus=$(swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused==true) | .pid')
    # if [[ $focus == "null" ]]; then
    #     ${EWW_BIN} update revealdock=true
    # else 
    #     ${EWW_BIN} update revealdock=false
    # fi
    $HOME/.config/eww_sway/sidebar/scripts/icon.py
done
