#!/usr/bin/env bash

# Set your wallpaper directory here
WALLPAPER_DIR="/home/draco/.config/swww/wallpapers/"

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
  swww img "${random}" --transition-step 110 --transition-type center --transition-fps 24
 
  wal -i "${random}"
  pywalfox update

  dunstify "Changed Wallpaper to ${random}" -a "wallpaper" -i "${random}" -r 91190 -t 2000
else
  echo "Error: No wallpapers found in the specified directory."
fi
