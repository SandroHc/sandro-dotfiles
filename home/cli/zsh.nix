{config, pkgs, lib, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh"; # Can't use "${config.xdg.configHome}/zsh" because this setting expects a relative path from $HOME.

    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
      theme = "agnoster";
    };

    history = {
      save = 1000;
      size = 1000;
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
      path = config.xdg.dataHome;
    };

    shellAliases = {
      vi = lib.getExe pkgs.neovim;
      vim = lib.getExe pkgs.neovim;
#      cat = lib.getExe pkgs.bat; # already aliased?
#      grep = lib.getExe pkgs.ripgrep; # already aliased to grep?

      # ls
      ls = "${lib.getExe pkgs.eza} -h --git --icons --color=auto --group-directories-first -s extension";
      l = "ls --long -a --time-style=long-iso --icons";
      tree = "${lib.getExe pkgs.eza} --tree --icons";

      g = lib.getExe pkgs.git;

      # nix
      n = lib.getExe pkgs.nix;
      nrs = "sudo nixos-rebuild switch --flake /etc/nixos#$(hostname)";
      nrb = "sudo nixos-rebuild boot --flake /etc/nixos#$(hostname)";

      # misc
      kys = "shutdown now";
      diff = "diff --color=auto";
#      difft = "${lib.getExe pkgs.difftastic} --display=inline";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
    };
  };
}

