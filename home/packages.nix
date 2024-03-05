{pkgs, ...}: {
  # figure out how to setup NUR - https://github.com/NL-TCH/nur-packages?tab=readme-ov-file
  #  pkgs.packageOverrides = pkgs: {
  #    nur = import (builtins.fetchTarball {
  #      url = "https://github.com/nix-community/NUR/archive/0816526817921ed5f0b39b8f68824a6bf20f091a.tar.gz";
  #      sha256 = "foo";
  #    }) {
  #      inherit pkgs;
  #    };
  #  };

  home.packages = with pkgs; [
    firefox
    steam
    transmission-gtk
    libreoffice-fresh
    hunspell
    hunspellDicts.en_US
    hunspellDicts.pt_PT
    # gimp
    # wireshark
    # keepassxc
  ];
}
