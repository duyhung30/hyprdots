#!/bin/sh
swayidle -d -w \
                timeout 900 'hyprctl dispatch dpms off && swaylock' \
                timeout 1800 'systemctl suspend' &
