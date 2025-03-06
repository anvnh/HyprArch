source ./scripts/message.sh
echo 'alias sz="source ~/.zshrc"' >> ~/.zshrc
echo 'alias nz="nvim ~/.zshrc"' >> ~/.zshrc
echo 'alias st="tmux source ~/.config/tmux/tmux.conf"' >> ~/.zshrc
echo 'alias nt="nvim ~/.config/tmux/tmux.conf"' >> ~/.zshrc
# ---- FZF ----
echo 'eval "$(fzf --zsh)"' >> ~/.zshrc
# ---- Warp ----
echo 'alias 1111="warp-cli connect"' >> ~/.zshrc
echo 'alias 2222="warp-cli disconnect"' >> ~/.zshrc
# ---- Ping ----
echo 'alias p8="gping 8.8.8.8"' >> ~/.zshrc
# ---- Eza ----
echo 'alias ls="eza --color=always --long --git --icons=always"' >> ~/.zshrc
# ---- TheFUCK ----
echo 'eval $(thefuck --alias fk)' >> ~/.zshrc
# ---- Zoxide (better cd) ----
echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc
echo 'alias cd="z"' >> ~/.zshrc

print_message "32" "Alias setup is complete."
