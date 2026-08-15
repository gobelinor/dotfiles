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

# Fichiers de config (backup de l'existant)
for f in .zshrc .zprofile; do
    [ -f "$HOME/$f" ] && cp "$HOME/$f" "$HOME/$f.bak"
    cp "$f" "$HOME/$f"
done

# Fichier de secrets local
[ -f ~/.zshenv.local ] || cp .zshenv.local.example ~/.zshenv.local

echo "Fait. Édite ~/.zshenv.local (token WPScan), puis : source ~/.zshrc"
echo "Optionnel : brew install openjdk@17 postgresql@17 go miniconda docker"
echo "Android SDK : à installer manuellement dans ~/Tools/Android si pentest mobile"
