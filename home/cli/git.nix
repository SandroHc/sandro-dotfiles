{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "Sandro Marques";
    userEmail = "sandro123iv@gmail.com";
#    signing = {
#      key = "/etc/ssh/ssh_host_rsa_key";
#      signByDefault = true;
#    };
    ignores = [
      "*.iml"
      ".idea/"
    ];
    extraConfig = {
    };
    aliases = {
      amend-date = "commit --amend --no-edit --date=now";
    };
  };
}
