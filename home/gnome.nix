{...}: {
  # TODO: setup user background through dconf and user avatar through:
  #[nix-shell:/var/lib/AccountsService/icons]# cat /var/lib/AccountsService/users/sandro
  #[User]
  #Session=
  #Icon=/var/lib/AccountsService/icons/sandro
  #SystemAccount=false
  #
  #[nix-shell:/var/lib/AccountsService/icons]# file /var/lib/AccountsService/icons/sandro
  #/var/lib/AccountsService/icons/sandro: PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced


  dconf = {
    enable = true;

    # See settings with: dconf dump /

    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

    # Enable fractional scaling
    settings."org/gnome/mutter".experimental-features = "['scale-monitor-framebuffer']";
  };
}
