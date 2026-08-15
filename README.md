# dotfiles

Config shell (zsh) + terminal (iTerm2) pour macOS — déploiement sur nouvelle machine.

## Contenu

- `.zshrc` — oh-my-zsh (theme af-magic), PATH (Python/Go), aliases, fzf
- `.zprofile` — homebrew shellenv + OrbStack
- `iterm2/com.googlecode.iterm2.plist` — préférences iTerm2
- `install.sh` — installe homebrew/omz/fzf/vim/iTerm2 et copie les dotfiles

## Déploiement

```bash
git clone git@github.com:gobelinor/dotfiles.git
cd dotfiles
./install.sh
```

Puis pointer iTerm2 vers le repo (une fois, sur chaque machine) :

1. iTerm2 → Settings → General → Preferences
2. Cocher **"Load preferences from a custom folder or URL"** → sélectionner `<clone>/iterm2`
3. Cocher **"Save changes to folder when iTerm2 quits"**

Les changements de réglages iTerm2 atterrissent alors dans le repo à chaque
fermeture d'iTerm2 — commit/push d'un côté, pull de l'autre.

## Trucs machine-spécifiques et secrets

`~/.zshrc.local` (gitignored, sourcé par `.zshrc`) — mettre là les secrets et
aliases locaux. Exemple pour WPScan :

```bash
export WPSCAN_API_TOKEN="..."
alias wpscan='docker run --rm -it wpscanteam/wpscan --api-token "$WPSCAN_API_TOKEN"'
```

## Notes

- conda : réinstaller miniconda puis `conda init zsh` si besoin (auto-généré)
- vim : config séparée → [vimconfig](https://github.com/gobelinor/vimconfig)
