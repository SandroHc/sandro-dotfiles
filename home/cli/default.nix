{pkgs, ...}: {
  imports = [
    ./zsh.nix
    ./git.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = with pkgs; [
    difftastic # `diff` alternative
    exif
    fd # `find` alternative
    ffmpeg-full
    file
    fzf # fuzzy file search
    hexyl # hex viewer
    imagemagick
    jql # JSON query
    libnotify # for `notify-send`
    nmap
    oha # HTTP load generator
    ouch # file de/compress
    rclone # cloud sync
    restic # backup utility
    ripgrep # `grep` alternative
    rsync
    wl-clipboard
    yt-dlp
  ];

  programs = {
    gpg.enable = true;
    man.enable = true;
    eza.enable = true; # `ls` alternative
    dircolors = {
      enable = true;
      enableZshIntegration = true;
    };
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };
    tealdeer = {
      enable = true;
      settings.updates.auto_update = true;
    };
    bat = {
      enable = true;
      config = {
        pager = "less -FR";
      };
    };
    zoxide.enable = true;
  };

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "gnome3";
  };
}
