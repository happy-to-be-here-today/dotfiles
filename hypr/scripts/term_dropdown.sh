#!/bin/bash

pid=$(pgrep -f "kitty --class quake")
wsp=$(hyprctl activeworkspace | grep ID|awk '{print $3}' | grep -oE '^\s*[0-9]+')
spec=$(hyprctl workspaces | grep special)

if  [ -n "$spec" ]; then
	hyprctl dispatch movetoworkspace $wsp,pid:$pid
else 
	hyprctl dispatch togglespecialworkspace special,pid:$pid
fi
