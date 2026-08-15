# =============================================================================
# .zshrc — config principale
# Prérequis : oh-my-zsh, homebrew, fzf (voir README / install.sh)
# =============================================================================

# --- Oh My Zsh ---------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="af-magic"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# Les alias du plugin git omz masquent des outils de recon (gau, gf)
unalias gau gf 2>/dev/null

# --- PATH --------------------------------------------------------------------
# Homebrew packages
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

# Python user bin (pip --user) + pipx
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"

# Go
export PATH="$PATH:$HOME/go/bin"

# Android SDK
export ANDROID_HOME="$HOME/Tools/Android"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools"
export PATH="$ANDROID_HOME/build-tools/34.0.0:$PATH"
export PATH="$HOME/Library/Python/3.9/lib/python/site-packages/jadx/bin:$PATH"

# Divers outils
export PATH="$PATH:$HOME/.foundry/bin"
export PATH="$PATH:$HOME/.opencode/bin"

# --- Aliases -----------------------------------------------------------------
alias ll='ls -laht'
alias py='python3'
alias vim="/opt/homebrew/bin/vim"
alias venv='py -m venv venv && source venv/bin/activate'
alias pidcat='python3 $HOME/Tools/pidcat/pidcat.py'
alias rfswift='/usr/local/bin/rfswift'

# WPScan — le token API vit dans ~/.zshenv.local (JAMAIS dans ce repo) :
#   export WPSCAN_API_TOKEN="..."
alias wpscan='docker run --rm -it wpscanteam/wpscan --api-token "$WPSCAN_API_TOKEN"'

# Chrome avec remote debugging (CDP)
alias chrome-cdp='"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --remote-debugging-port=9222 --user-data-dir=/tmp/chrome-cdp'

# --- fzf ----------------------------------------------------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# --- Secrets et overrides locaux ----------------------------------------------
[ -f ~/.zshenv.local ] && source ~/.zshenv.local
