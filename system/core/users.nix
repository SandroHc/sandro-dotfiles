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
        openssh.authorizedKeys.keyFiles = [
          ../../hosts/kurisu/ssh.pub
          ../../hosts/hanekawa/ssh.pub
        ];
        extraGroups = ["wheel" "networkmanager" "systemd-journal" "docker"];
      };
    };
  };
}
