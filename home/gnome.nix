{
  config,
  lib,
  ...
}: {
  # TODO: setup user background through dconf and user avatar through:
  #[nix-shell:/var/lib/AccountsService/icons]# cat /var/lib/AccountsService/users/sandro
  #[User]
  #Session=
  #Icon=/var/lib/AccountsService/icons/sandro
  #SystemAccount=false
  #
  #[nix-shell:/var/lib/AccountsService/icons]# file /var/lib/AccountsService/icons/sandro
  #/var/lib/AccountsService/icons/sandro: PNG image data, 512 x 512, 8-bit/color RGBA, non-interlaced

  xdg.configFile."background".source = ./background.jpg;

  # dconf settings. See all settings with: dconf dump /
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/background" = {
        picture-options = "zoom";
        picture-uri = config.xdg.configFile."background".target;
        picture-uri-dark = config.xdg.configFile."background".target;
      };
      "org/gnome/desktop/input-sources".sources = [
        (lib.gvariant.mkTuple ["xkb" "us+intl"])
        (lib.gvariant.mkTuple ["xkb" "pt"])
      ];
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/shell".favorite-apps = ["firefox.desktop" "org.gnome.Nautilus.desktop"];
      "org/gnome/nautilus/preferences".show-image-thumbnails = "always";

      # Enable fractional scaling
      # "org/gnome/mutter".experimental-features = "['scale-monitor-framebuffer']";
    };
  };
}
