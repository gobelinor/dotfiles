# =============================================================================
# .zshrc — config principale
# Prérequis : oh-my-zsh, homebrew, fzf (voir install.sh)
# =============================================================================

# --- Oh My Zsh ---------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="af-magic"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# --- PATH --------------------------------------------------------------------
# Python user bin (pip --user) + pipx
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"

# Go
export PATH="$PATH:$HOME/go/bin"

# --- Aliases -----------------------------------------------------------------
alias ll='ls -laht'
alias py='python3'
alias vim="/opt/homebrew/bin/vim"
alias venv='py -m venv venv && source venv/bin/activate'

# --- fzf ----------------------------------------------------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# --- Overrides locaux (secrets, trucs machine-spécifiques) --------------------
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
