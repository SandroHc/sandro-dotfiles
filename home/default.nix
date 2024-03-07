{...}: {
  imports = [
    ./apps
    ./cli
    ./scripts
    ./gnome.nix
  ];

  # XDG Base Directory Specification - https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
  config.xdg.enable = true;
  config.xdg.mime.enable = true;

  # Nicely reload system units when changing configs
  config.systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  config.home.stateVersion = "23.11";
}
