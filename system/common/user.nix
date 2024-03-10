{pkgs, ...}: {
  programs.zsh.enable = true;

  users = {
    mutableUsers = false;
    users = {
      sandro = {
        description = "SandroHc";
        isNormalUser = true;
        uid = 1000;
        hashedPasswordFile = "/home/sandro/.local/share/secrets/passwd"; # TODO: use XGD state dir
        shell = pkgs.zsh;
        extraGroups = ["wheel" "networkmanager" "systemd-journal" "docker"];
        openssh.authorizedKeys.keyFiles = [
          ../../hosts/kurisu/ssh.pub
          ../../hosts/hanekawa/ssh.pub
        ];
      };
    };
  };
}
