# sandro-dotfiles
Personal .dotfiles repository

## Base

### WIP: Metapackage ideas
qol - install better rust replacements
devel - development tools: intellij toolbox, java, python, node, rust

### Setup SSH keys
copy priv and pubkey from safe location
add privkey to authorized_keys

### Setup Pacman
```sh
sudo vim /etc/pacman.conf
# uncomment `Color` and `ParallelDownloads = 5`
```

### Setup [Paru](https://github.com/Morganamilo/paru)
*Note: Paru is used to install AUR packages and is the successor to Yaourt.*
```sh
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si && cd .. && rm -rf paru

# automatic cleaning of pacman cache (weekly)
paru -S pacman-contrib
sudo systemctl enable paccache.timer
```

### Setup alternative tools
- `bat` is a `cat` replacement
- `exa` is a `ls` replacement
- `fd` is a `find` replacement
- `fxf` is a fuzzy search tools
- `ripgrep` is a `grep` replacement

```sh
pacman -S bat exa fd fzf ripgrep
```

### Setup [chezmoi](https://chezmoi.io/)
```sh
sudo pacman -S chezmoi
chezmoi init --apply https://github.com/SandroHc/sandro-dotfiles.git

# cheatsheet
chezmoi update
chezmoi diff
chezmoi edit $FILE
chezmoi merge $FILE
chezmoi apply --dry-run --verbose
```

### Setup [kitty](https://sw.kovidgoyal.net/kitty/)
```sh
sudo pacman -S kitty
```

### Setup Git
```sh
sudo pacman -S git
```


WIP: setup zsh
