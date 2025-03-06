source ./scripts/message.sh
print_message "33" "Setting up CLI tools..."
#  _____ __________ 
# |  ___|__  /  ___|
# | |_    / /| |_   
# |  _|  / /_|  _|  
# |_|   /____|_| 
# Change theme fzf to catppuccin
echo 'export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"' >> ~/.zshrc
# Install fzf-git
cd && git clone https://github.com/junegunn/fzf-git.sh.git
# open ~/.zshrc and add source ~/fzf-git.sh/fzf-git.sh
echo "source ~/fzf-git.sh/fzf-git.sh" >> ~/.zshrc 

#  ____    _  _____ 
# | __ )  / \|_   _|
# |  _ \ / _ \ | |  
# | |_) / ___ \| |  
# |____/_/   \_\_|  
mkdir -p "$(bat --config-dir)/themes"
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Latte.tmTheme
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
bat cache --build
echo 'export BAT_THEME="Catppuccin Mocha"' >> ~/.zshrc

#  _____ __  __ _   ___  __
# |_   _|  \/  | | | \ \/ /
#   | | | |\/| | | | |\  / 
#   | | | |  | | |_| |/  \ 
#   |_| |_|  |_|\___//_/\_\
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
mkdir -p ~/.config/tmux
touch ~/.config/tmux/tmux.conf
cat tmux > ~/.config/tmux/tmux.conf
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
