{pkgs, ...}: {
  imports = [
    ./devel.nix
    ./discord.nix
    ./mpv.nix
  ];

  home.packages = with pkgs; [
    # davinci-resolve
    firefox
    # gimp
    inkscape
    # keepassxc
    qbittorrent
    # obsidian
    # wireshark

    # NUR
    # https://github.com/NL-TCH/nur-packages/tree/master/pkgs/spotify-adblock
    nur.repos.nltch.spotify-adblock

    wineWowPackages.stable
    bottles

    # social
    # telegram-desktop
    # signal-desktop
    # whatsapp-for-linux

    # gaming
    steam
    lutris

    # productivity
    libreoffice-fresh
    hunspell
    hunspellDicts.en_US
    hunspellDicts.pt_PT
  ];
}
