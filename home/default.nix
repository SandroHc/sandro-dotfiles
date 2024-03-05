{...}: {
  imports = [
    ./packages.nix
    ./cli
    ./scripts
    ./vencord
  ];

  # Nicely reload system units when changing configs
  config.systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  config.home.stateVersion = "23.11";
}
