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
        uid = 1000;
        # initialPassword = "changeme";
        hashedPasswordFile = "/home/sandro/.local/share/passwd";
        shell = pkgs.zsh;
        # openssh.authorizedKeys.keys = import ./openssh-auth-keys.nix;
        openssh.authorizedKeys.keys = [
          "ssh-ed25565 foo sandro@kurisu"
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDpZJbJx2ajr8VZkSwziX9zRkS7tB5u7/tnI6iUsJod+ sandro@hanekawa"
        ];
        extraGroups = ["wheel" "networkmanager" "systemd-journal" "docker"];
      };
    };
  };
}
