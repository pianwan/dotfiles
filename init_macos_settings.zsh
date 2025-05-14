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
