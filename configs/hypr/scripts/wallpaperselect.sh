#!/usr/bin/env bash

# set variables
RofiConf="$HOME/.config/rofi/wallpaperselect.rasi"
wallPath="$HOME/.config/swww/wallpapers/"


# launch rofi menu
RofiSel=$( find -L "${wallPath}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) -exec basename {} \; | sort | while read rfile
    do
        echo -en "$rfile\x00icon\x1f${wallPath}/${rfile}\n"
done | rofi -show -dmenu -theme  "${RofiConf}" -select "${currentWall}")

# apply wallpaper
if [ ! -z "${RofiSel}" ] ; then
    selected="${wallPath}/${RofiSel}"

    swww img $selected \
        --transition-type "wipe" \
        --transition-duration 2

    notify-send "Wallpaper ${RofiSel}" -a "Wallpaper" -i "${wallPath}/${RofiSel}" -t 2200
    ln -sf "$selected" "$HOME/.config/swww/.current_wallpaper"

    wal -i "${selected}"
    pkill waybar && waybar
    swaync-client -rs
    pywal-discord

    pywalfox update
fi

