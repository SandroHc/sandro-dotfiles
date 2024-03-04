# TODO: read https://github.com/sioodmy/dotfiles/blob/main/home/misc/vencord/default.nix
{pkgs, ...}: {
  xdg.configFile."VencordDesktop/VencordDesktop/themes/self.theme.css".source = ./theme.css;
}
