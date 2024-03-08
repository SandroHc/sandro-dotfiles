{
  config,
  lib,
  ...
}: {
  dconf = {
    enable = true;

    # See all dconf settings with: dconf dump /
    # https://github.com/gvolpe/dconf2nix
    settings = with lib.gvariant; {
      "org/gnome/desktop/background" = {
        picture-options = "zoom";
        picture-uri = config.xdg.configFile."background".target;
        picture-uri-dark = config.xdg.configFile."background".target;
      };
      "org/gnome/desktop/input-sources".sources = [
        (mkTuple ["xkb" "us+intl"])
        (mkTuple ["xkb" "pt"])
      ];
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      "org/gnome/shell" = {
        enabled-extensions = [
          "appindicatorsupport@rgcjonas.gmail.com"
        ];
        favorite-apps = [
          "firefox.desktop"
          "org.gnome.Nautilus.desktop"
        ];
      };
      "org/gnome/shell/extensions/appindicator" = {
        icon-saturation = 1.0;
      };
      "org/gnome/mutter" = {
        dynamic-workspaces = true;
        edge-tiling = true;
        experimental-features = [
          "scale-monitor-framebuffer" # fractional scaling
        ];
      };
      "org/gnome/nautilus/preferences".show-image-thumbnails = "always";
    };
  };
}
