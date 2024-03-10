{pkgs, ...}: {
  imports = [
    ./devel.nix
    ./discord.nix
    ./firefox.nix
    ./gnome.nix
    ./mpv.nix
  ];

  home.packages = with pkgs; [
    #audacity
    ##amberol (audio player)
    #calibre # e-book manager
    #kepubify # convert EPUB to KEPUB
    #davinci-resolve
    flameshot
    #gimp
    #inkscape
    #keepassxc
    qbittorrent
    #tor
    #obs-studio
    #obsidian
    #wireshark

    # NUR packages
    # https://github.com/NL-TCH/nur-packages/tree/master/pkgs/spotify-adblock
    nur.repos.nltch.spotify-adblock

    # Windows compat
    wineWowPackages.stable
    bottles

    # cloud
    #rclone
    ##megasync

    # social
    #element-desktop
    #telegram-desktop
    #signal-desktop
    #whatsapp-for-linux

    # gaming
    #steam
    #lutris
    #prismlauncher # Minecraft launcher

    # productivity
    libreoffice-fresh
    hunspell
    hunspellDicts.en_US
    hunspellDicts.pt_PT

    # AI/LLM
    ollama
  ];
}
