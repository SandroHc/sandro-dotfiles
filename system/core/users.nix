{
  config,
  pkgs,
  ...
}: {
  programs.zsh.enable = true;

  users = {
    mutableUsers = false;
    users = {
      sandro = {
        description = "SandroHc";
        isNormalUser = true;
        initialPassword = "changeme"; # Change with `passwd` after initial boot
        uid = 1000;
        shell = pkgs.zsh;
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAfoo sandro@kurisu"
          "ssh-ed25519 AAAAfoo sandro@hanekawa"
        ];
        extraGroups = ["wheel" "networkmanager" "systemd-journal" "docker"];
      };
    };
  };
}
