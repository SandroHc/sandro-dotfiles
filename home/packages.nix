{pkgs, ...}: {
  home.packages = with pkgs; [
    firefox
    steam
    transmission-gtk
    libreoffice-fresh
    hunspell
    hunspellDicts.en_US
    hunspellDicts.pt_PT
#    pulseaudio
#    gimp
#    wireshark
#    keepassxc
#    dconf
  ];
}
