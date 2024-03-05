{
  pkgs,
  lib,
  ...
}: {
  programs.git = {
    enable = true;
    userName = "Sandro Marques";
    userEmail = "sandro123iv@gmail.com";

    aliases = {
      amend-date = "commit --amend --no-edit --date=now";
    };

    ignores = [
      "*.iml"
      ".idea/"
    ];

    signing = {
      key = "/home/sandro/.ssh/id_ed25519.pub";
      signByDefault = true;
    };

    extraConfig = {
      gpg.format = "ssh";
      merge.ff = "only";
      pull.rebase = true;
      "url \"git@github.com:SandroHc\"".insteadOf = "https://github.com/SandroHc";
    };

    lfs.enable = lib.mkDefault true;
  };
}
