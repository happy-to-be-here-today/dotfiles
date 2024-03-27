#!/bin/bash
pid=$(pgrep -f "kitty -a quake")
wsp=$(hyprctl activeworkspace | grep ID | awk '{print $3}' | grep -oE '^\s*[0-9]+')
spec=$(hyprctl workspaces | grep special)

if [[ -n $spec ]]; then
    hyprctl dispatch movetoworkspace $wsp,pid:$pid
else
    hyprctl dispatch movetoworkspacesilent special,pid:$pid
fi
