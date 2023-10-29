# sandro-dotfiles
Personal .dotfiles repository

## Shortcuts

TODO: manage shortcuts in this repo
META + Q - terminal
META + arrow up - maximize window
CTRL + Q - close window

## Base

### WIP: Metapackage ideas
base - SSH keys, Firefox
qol - neovim and better alternatives to GNU tools
cli - zsh
de - setup desktop environment
devel[_{rust,java,python,node,jetbrains}]
gaming - gaming deps like Proton
ai - stable diffusion


### Setup SSH keys
copy priv and pubkey from safe location
add privkey to authorized_keys

### Setup Pacman
```sh
sudo vim /etc/pacman.conf
# uncomment `Color` and `ParallelDownloads = 5`
```

## Cheatsheets

### [chezmoi](https://chezmoi.io/)
chezmoi is a dotfiles manager.

```sh
sudo pacman -S chezmoi
chezmoi init --apply https://github.com/SandroHc/sandro-dotfiles.git

# cheatsheet
chezmoi cd
chezmoi update
chezmoi diff
chezmoi apply --dry-run --verbose
chezmoi edit $FILE
chezmoi merge $FILE
```

### [Hyprland](https://hyprland.org/)
[Hyprland](https://hyprland.org/) is a desktop environment based on Wayland.

bar: eww, waybar
notification daemon: [dunst](https://dunst-project.org), [mako](https://github.com/emersion/mako) (both depend on libnotify)
[desktop portal](https://wiki.archlinux.org/title/XDG_Desktop_Portal): xdg-desktop-portal-wlr and xdg-desktop-portal-gtk
compositor: [wlroots](https://gitlab.freedesktop.org/wlroots/wlroots) (installed by defaul)
wallpaper daemons: [swww](https://github.com/Horus645/swww), [hyprpaper](https://github.com/hyprwm/hyprpaper)
terminal: [kitty](https://sw.kovidgoyal.net/kitty/), alacritty
app launcher: [rofi-wayland](https://github.com/lbonn/rofi#wayland-support), wofi (GTK based)

https://github.com/hyprland-community/awesome-hyprland

```shell
sudo pacman -S hyprland

# terminal
sudo pacman -S kitty

# notification daemon
sudo pacman -S dunst
cp /etc/dunst/dunstrc ~/.config/dunst/dunstrc

# desktop portal
pacman -S xdg-desktop-portal-hyprland xdg-desktop-portal-gtk

# authentication agent (confirm if working! official docs recommend `polkit-kde-agent`)
pacman -S polkit-gnome
exec-once=/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
 or
exec --no-startup-id /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

# Qt support
sudo pacman -S qt5-wayland qt6-wayland

# status bar
paru eww-wayland
cp -R /etc /xdg/eww/eww-bar/* ~/.config/eww/
eww daemon
eww open <window name>

# app launcher
paru rofi-lbonn-wayland-git
rofi &
rofi -show run

# wallpaper
paru swww
swww init &
swww img img.png &

# screensharing
sudo pacman -S pipewire wireplumber grim slurp
exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP


# cheatsheet
## start hyprland
Hyprland

## list available monitors
hyprctl monitors


# shortcuts
SUPER + Q - launch kitty
SUPER + M - restart Hyprland
```
