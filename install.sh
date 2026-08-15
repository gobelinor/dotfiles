#!/bin/bash
# Déploie la config shell sur une nouvelle machine macOS.
set -e

# Prérequis : Xcode CLT (git) — xcode-select --install

# Homebrew
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# fzf
command -v fzf &>/dev/null || brew install fzf
[ -f ~/.fzf.zsh ] || "$(brew --prefix)/opt/fzf/install" --all --no-bash --no-fish

# Vim (version homebrew, cf. alias vim)
command -v /opt/homebrew/bin/vim &>/dev/null || brew install vim

# Fichiers de config (backup de l'existant)
for f in .zshrc .zprofile; do
    [ -f "$HOME/$f" ] && cp "$HOME/$f" "$HOME/$f.bak"
    cp "$f" "$HOME/$f"
done

echo "Fait. Ouvre un nouveau terminal ou : source ~/.zshrc"
echo "Pour les trucs machine-spécifiques/secrets : ~/.zshrc.local (sourcé par .zshrc)"
