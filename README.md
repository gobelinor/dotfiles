# shellconfig

Config shell (zsh) pour macOS — déploiement sur nouvelle machine.

## Contenu

- `.zshrc` — oh-my-zsh (theme af-magic), PATH (Python/Go), aliases, fzf
- `.zprofile` — homebrew shellenv + OrbStack
- `install.sh` — installe homebrew/omz/fzf/vim et copie les dotfiles

## Déploiement

```bash
git clone git@github.com:gobelinor/shellconfig.git
cd shellconfig
./install.sh
```

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
