#!/bin/zsh

# increase zoom animation speed
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
# disable tex correction
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
# skip dmg verify
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
# allow 3rd app
sudo spctl --master-disable
defaults write com.apple.LaunchServices LSQuarantine -bool false
# drag window
defaults write -g NSWindowShouldDragOnGesture -bool true

# init iterm integration
curl -L https://iterm2.com/shell_integration/`basename $SHELL` -o ~/.iterm2_shell_integration.`basename $SHELL`
source ~/.iterm2_shell_integration.`basename $SHELL`
# zsh starship theme
curl -sS https://starship.rs/install.sh | sh

# zsh plugins
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