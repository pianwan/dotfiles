#!/bin/zsh

# zsh starship theme
curl -sS https://starship.rs/install.sh | sh -s -- -y

# omz plugins
typeset -A plugins
plugins=(
  zsh-autosuggestions        https://github.com/zsh-users/zsh-autosuggestions
  zsh-completions            https://github.com/zsh-users/zsh-completions
  fast-syntax-highlighting   https://github.com/zdharma-continuum/fast-syntax-highlighting
)

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

for plugin in "${(@k)plugins}"; do
  PLUGIN_DIR="$ZSH_CUSTOM/plugins/$plugin"
  REPO="${plugins[$plugin]}"

  if [ ! -d "$PLUGIN_DIR" ]; then
    git clone "$REPO" "$PLUGIN_DIR"
  else
    git -C "$PLUGIN_DIR" pull --quiet
  fi
done