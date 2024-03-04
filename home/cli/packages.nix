{pkgs, ...}: {
  home.packages = with pkgs; [
    ripgrep     # `grep` alternative
    yt-dlp
#    tealdeer    # tldr for man pages
    imagemagick
    ffmpeg-full
    nmap
    wget
    fd          # `find` alternative
    rsync
    unzip

#    difftastic # `diff` alternative
#    fzf        # fuzzy file search
#    hexyl      # hex viewer
#    jql        # JSON query
#    oha        # HTTP load generator
#    zoxide     # `cd` alternative
  ];

  services = {
    gpg-agent = {
      enable = true;
#      pinentryFlavor = "gnome3";
      enableSshSupport = true;
      enableZshIntegration = true;
    };
  };

  programs = {
    gpg.enable = true;
    man.enable = true;
    eza.enable = true;
    dircolors = {
      enable = true;
      enableZshIntegration = true;
    };
    tealdeer = {
      enable = true;
      settings = {
#        display = {
#          compact = false;
#	  use_pager = true;
#	};
	updates.auto_update = true;
      };
    };
    bat = {
      enable = true;
      config = {
        pager = "less -FR";
      };
    };
  };
}
