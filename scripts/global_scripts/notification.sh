source ./scripts/message.sh
mkdir -p ~/.config/dunst
touch ~/.config/dunst/dunstrc
cat ./configs/dunstrc > ~/.config/dunst/dunstrc

mkdir -p ~/.config/dunst/icons
# Move hyprland.svg to ~/.config/dunst/icons
cp ./configs/icons/hyprland.svg ~/.config/dunst/icons/hyprland.svg

