#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/.config/swww/wallpapers/"
scriptsDir="$HOME/.config/hypr/scripts"

# Ensure the directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Error: Wallpaper directory not found."
    exit 1
fi

# Get a list of all files in the wallpaper directory
files=("$WALLPAPER_DIR"/*)

# Check if there are wallpapers in the directory
if [ ${#files[@]} -ge 1 ]; then
    # Randomly select a wallpaper
    random="${files[RANDOM % ${#files[@]}]}"

    # Set the wallpaper using your swww and wal commands
    swww img "${random}" --transition-step 110 --transition-type any --transition-fps 60 --transition-duration 2

    ln -sf "$random" "$HOME/.config/swww/.current_wallpaper"
    sleep 0.2
    wal -i "${random}"
    # pywalfox update
    swaync-client -rs
    pkill waybar && waybar
    pywal-discord
else
    echo "Error: No wallpapers found in the specified directory."
fi
