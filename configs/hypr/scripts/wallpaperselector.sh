#!/bin/bash

# Set variables
scrDir="$(dirname "$(realpath "$0")")"
source "${scrDir}/globalcontrol.sh"
roconf="${confDir}/rofi/styles/style_${rofiStyle}.rasi"

[[ "${rofiScale}" =~ ^[0-9]+$ ]] || rofiScale=10

if [ ! -f "${roconf}" ] ; then
    roconf="$(find "${confDir}/rofi/styles" -type f -name "style_*.rasi" | sort -t '_' -k 2 -n | head -1)"
fi
# Define the wallpaper directory
WALLPAPER_DIR="$HOME/.config/hypr/wallpapers"
CURRENT_WALLPAPER_INDEX="$WALLPAPER_DIR/current_wallpaper_index"


# Check if the wallpaper directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
    notify-send "Wallpaper Selector" "Directory $WALLPAPER_DIR does not exist!"
    exit 1
fi

# Find the currently used rofi theme
ROFI_THEME=$(find "$HOME/.config/rofi/styles" -type f -name "style_*.rasi" | sort -t '_' -k 2 -n | head -1)
[ -z "$ROFI_THEME" ] && ROFI_THEME="$HOME/.config/rofi/theme.rasi"

wind_border=$(( hypr_border * 1 ))
[ "${hypr_border}" -eq 0 ] && elem_border="10" || elem_border=$(( hypr_border * 2 ))
r_override="window {border: ${hypr_width}px; border-radius: ${wind_border}px;} element {border-radius: ${elem_border}px;}"
r_scale="configuration {font: \"JetBrainsMono Nerd Font ${rofiScale}\";}"
i_override="$(gsettings get org.gnome.desktop.interface icon-theme | sed "s/'//g")"
i_override="configuration {icon-theme: \"${i_override}\";}"

# Get wallpaper list
WALLPAPER_LIST=$(ls "$WALLPAPER_DIR" | grep -E "\.(jpg|png|jpeg)$")

# Start imv in the background to show preview
IMV_PID=""
imv --fullscreen $WALLPAPER_DIR/* &> /dev/null & IMV_PID=$!

# Display wallpaper options in rofi
CHOICE=$(echo "$WALLPAPER_LIST" | rofi -dmenu -p "Select Wallpaper"\ -theme-str "${r_scale}" -theme-str "${r_override}" -theme-str "${i_override}" -config "${roconf}")

# Close preview
[ ! -z "$IMV_PID" ] && kill $IMV_PID

# Exit if no selection is made
[ -z "$CHOICE" ] && exit 0

# Get the selected wallpaper path
SELECTED_WALLPAPER="$WALLPAPER_DIR/$CHOICE"

# Save the current wallpaper index
echo "$CHOICE" > "$CURRENT_WALLPAPER_INDEX"

# Set the wallpaper using available tools
if command -v swww &> /dev/null; then
    swww img "$SELECTED_WALLPAPER" --transition-fps 120 --transition-type center --transition-duration 2
    # swww img "${DIR}/${PICS[$NEXT_INDEX]}" --transition-fps 120 --transition-type center --transition-duration 2
elif command -v hyprctl &> /dev/null; then
    hyprctl hyprpaper preload "$SELECTED_WALLPAPER"
    hyprctl hyprpaper wallpaper "eDP-1,$SELECTED_WALLPAPER"
elif command -v feh &> /dev/null; then
    feh --bg-fill "$SELECTED_WALLPAPER"
else
    notify-send "Wallpaper Selector" "No valid wallpaper tool found (swww, hyprctl, or feh)!"
    exit 1
fi

# Send a notification that the wallpaper has been changed
notify-send "Wallpaper Changed" "New wallpaper applied: $CHOICE"
