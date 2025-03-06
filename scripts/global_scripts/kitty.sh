source ./scripts/message.sh
print_message "33" "Setting up Kitty terminal..."
git clone https://github.com/catppuccin/kitty.git
cd kitty/themes
mkdir -p ~/.config/kitty
cp mocha.conf ~/.config/kitty/
touch ~/.config/kitty/kitty.conf
echo "include mocha.conf" > ~/.config/kitty/kitty.conf
echo "font_size 13.0" > ~/.config/kitty/kitty.conf
echo "window_padding_width 0" > ~/.config/kitty/kitty.conf
echo "background_opacity 0.6" > ~/.config/kitty/kitty.conf
echo "background_blur 1" > ~/.config/kitty/kitty.conf
rm -rf kitty

# Install Oh My Zsh and plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Install powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Install zsh plugins
git clone "https://github.com/MichaelAquilina/zsh-autoswitch-virtualenv.git" "$ZSH_CUSTOM/plugins/autoswitch_virtualenv"
git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Change plugins=(git) to plugins=(git zsh-autosuggestions zsh-syntax-highlighting autoswitch_virtualenv vi-mode)
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting autoswitch_virtualenv vi-mode)/' ~/.zshrc
# Remove the default and set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc 
sed -i 's/^ZSH_THEME=.*/ZSH_THEME=powerlevel10k\/\powerlevel10k/' ~/.zshrc
source ~/.zshrc
