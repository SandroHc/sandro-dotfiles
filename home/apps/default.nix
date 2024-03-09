{pkgs, ...}: {
  imports = [
    ./devel.nix
    ./discord.nix
    ./gnome.nix
    ./mpv.nix
  ];

  home.packages = with pkgs; [
    # amberol (audio player)
    # davinci-resolve
    firefox
    flameshot
    # gimp
    inkscape
    # keepassxc
    qbittorrent
    # obs-studio
    # obsidian
    # wireshark

    # NUR
    # https://github.com/NL-TCH/nur-packages/tree/master/pkgs/spotify-adblock
    nur.repos.nltch.spotify-adblock

    wineWowPackages.stable
    bottles

    # social
    # element-desktop
    # telegram-desktop
    # signal-desktop
    # whatsapp-for-linux

    # gaming
    steam
    lutris
    # prismlauncher # Minecraft launcher

    # productivity
    libreoffice-fresh
    hunspell
    hunspellDicts.en_US
    hunspellDicts.pt_PT

    # AI/LLM
    ollama
  ];
}
