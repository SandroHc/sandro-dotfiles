{
  config,
  pkgs,
  lib,
  nixpkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh"; # Can't use "${config.xdg.configHome}/zsh" because this setting expects a relative path from $HOME.

    initExtra = ''
      # Powerlevel10k config
      . ${./p10k.zsh}

      # Mitto config
      if [ -f "''${XDG_DATA_HOME:-$HOME/.local/share}/secrets/mitto" ]; then
        . "''${XDG_DATA_HOME:-$HOME/.local/share}/secrets/mitto"
      fi
    '';

    plugins = [
      {
        name = "powerlevel10k";
        file = "powerlevel10k.zsh-theme";
        src = pkgs.fetchFromGitHub {
          owner = "romkatv";
          repo = "powerlevel10k";
          rev = "v1.20.0";
          sha256 = "ES5vJXHjAKw/VHjWs8Au/3R+/aotSbY7PWnWAMzCR8E=";
        };
      }
    ];

    history = {
      save = 1000;
      size = 1000;
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
      path = "${config.xdg.dataHome}/history";
    };

    shellAliases = {
      e = "\${EDITOR:-nvim}";
      cat = lib.getExe pkgs.bat;
      catp = "cat --style=plain --paging=never";
      grep = lib.getExe pkgs.ripgrep;
      ls = "${lib.getExe pkgs.eza} --icons --group-directories-first";
      l = "ls --long --header --all --time-style=long-iso";
      cd = "z"; # `zoxide query` alias

      g = lib.getExe pkgs.git;

      # nix
      n = lib.getExe pkgs.nix;
      nrs = "sudo nixos-rebuild switch --flake /etc/nixos#$(hostname)";
      nrb = "sudo nixos-rebuild boot --flake /etc/nixos#$(hostname)";
      ng = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";

      # misc
      kys = "shutdown now";
      diff = "diff --color=auto";
      # difft = "${lib.getExe pkgs.difftastic} --display=inline";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
    };
  };
}
