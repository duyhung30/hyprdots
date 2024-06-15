#!/usr/bin/sh

exec wl-paste -t text --watch clipman store &
# rm -f /tmp/sovpipe && mkfifo /tmp/sovpipe && tail -f /tmp/sovpipe | sov &
swayidle -w \
	timeout 600 'swaylock -c 262626' \
	timeout 900 'swaymsg "output * dpms off"' \
		resume 'swaymsg "output * dpms on"' &

$(which eww) daemon &
# $(which eww) --config ~/.config/eww/carbonmonoxide open-many bar dock desktopicons notifypopup &
# $(which eww) --config ~/.config/eww_sway/carbonmonoxide open-many bar sidectl1 sidectl2 sidectl3 notifypopup --toggle &
$(which eww) --config ~/.config/eww_sway/carbonmonoxide open notifypopup &
$(which eww) --config ~/.config/eww_sway/sidebar open-many bar --toggle &
# $HOME/.config/eww/carbonmonoxide/scripts/toggletheme setup &

# I used to use waybar
# waybar &
# nm-applet --indicator &

fcitx5 &
# scratchpads
# foot -a sterm &
# foot -a sncmpcpp ncmpcpp &
# foot -a sranger ranger &
# swww-daemon &
# sh swww_randomize.sh ~/Pictures/animate &
# dunst &
# pulseaudio &
pipewire &
wireplumber &
pipewire-pulse &

mpd &
mpDris2 &
