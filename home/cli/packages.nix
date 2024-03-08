{pkgs, ...}: {
  home.packages = with pkgs; [
    difftastic # `diff` alternative
    exif
    fd # `find` alternative
    ffmpeg-full
    fzf # fuzzy file search
    hexyl # hex viewer
    imagemagick
    jql # JSON query
    nmap
    oha # HTTP load generator
    p7zip
    ripgrep # `grep` alternative
    rsync
    unzip
    wget
    yt-dlp
  ];

  services = {
    gpg-agent = {
      enable = true;
      # pinentryFlavor = "gnome3";
      enableSshSupport = true;
      enableZshIntegration = true;
    };
  };

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
      settings = {
        # display = {
        #   compact = false;
        #   use_pager = true;
        # };
        updates.auto_update = true;
      };
    };
    bat = {
      enable = true;
      config = {
        pager = "less -FR";
      };
    };
    zoxide.enable = true;
  };
}
