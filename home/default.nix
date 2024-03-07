{...}: {
  imports = [
    ./packages.nix
    ./cli
    ./scripts
    ./devel.nix
    ./vencord
    ./mpv.nix
  ];

  # TODO: setup user background through dconf and user avatar through:
  #[nix-shell:/var/lib/AccountsService/icons]# cat /var/lib/AccountsService/users/sandro
  #[User]
  #Session=
  #Icon=/var/lib/AccountsService/icons/sandro
  #SystemAccount=false
  #
  #[nix-shell:/var/lib/AccountsService/icons]# file /var/lib/AccountsService/icons/sandro
  #/var/lib/AccountsService/icons/sandro: PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced

  # XDG Base Directory Specification - https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
  config.xdg.enable = true;
  config.xdg.mime.enable = true;

  # Nicely reload system units when changing configs
  config.systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  config.home.stateVersion = "23.11";
}
