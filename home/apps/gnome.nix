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
      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/open-file-explorer/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/screenshot-local/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/screenshot-upload/"
        ];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/open-file-explorer" = {
        binding = "<Super>e";
        command = "nautilus";
        name = "Open File Explorer";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/screenshot-local" = {
        binding = "Print";
        command = "flameshot-workaround";
        name = "Take Screenshot";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/screenshot-upload" = {
        binding = "<Control>Print";
        command = "mitto-capture";
        name = "Take Screenshot & Upload";
      };
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
