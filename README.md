# shellconfig

Config shell (zsh) pour macOS — déploiement sur nouvelle machine.

## Contenu

- `.zshrc` — config principale (oh-my-zsh, theme af-magic, PATH, aliases)
- `.zprofile` — homebrew shellenv + OrbStack
- `.zshenv.local.example` — template pour les secrets (copier en `~/.zshenv.local`)
- `install.sh` — installe homebrew/omz/fzf et copie les fichiers

## Déploiement

```bash
git clone git@github.com:gobelinor/shellconfig.git
cd shellconfig
./install.sh
```

Puis éditer `~/.zshenv.local` pour y mettre le token WPScan.

## Secrets

**Jamais de secrets dans ce repo.** Le token API WPScan et tout futur secret
vivent dans `~/.zshenv.local` (gitignored), sourcé par `.zshrc`.

## Notes

- conda : réinstaller miniconda puis `conda init zsh` (bloc auto-généré, pas dans ce repo)
- vim : config séparée → [vimconfig](https://github.com/gobelinor/vimconfig)
