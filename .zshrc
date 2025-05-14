# Disable brew auto update
export HOMEBREW_NO_AUTO_UPDATE=1
export ZSH="$HOME/.oh-my-zsh"

plugins=(
  git
  zsh-completions
  zsh-autosuggestions
  fast-syntax-highlighting
  z
)

source .zsh_alias
source .zsh_funcs

# load auto completions with z
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
export ZSHZ_CASE=smart
export ZSHZ_TILDE=1

# use starship theme (needs to be at the end)
eval "$(starship init zsh)"
source $ZSH/oh-my-zsh.sh
source ~/.iterm2_shell_integration.`basename $SHELL`

# brew command-not-find
HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
if [ -f "$HB_CNF_HANDLER" ]; then
source "$HB_CNF_HANDLER";
fi