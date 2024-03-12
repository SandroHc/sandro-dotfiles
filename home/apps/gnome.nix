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
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
        ];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Super>e";
        command = "nautilus";
        name = "Open File Explorer";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        binding = "<Super>t";
        command = "kgx";
        name = "Open Terminal";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
        binding = "Print";
        command = "flameshot-workaround";
        name = "Take Screenshot";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
        binding = "<Control>Print";
        command = "mitto-capture";
        name = "Take Screenshot & Upload";
      };
      "org/gnome/shell" = {
        enabled-extensions = [
          "appindicatorsupport@rgcjonas.gmail.com"
          "clipboard-history@alexsaveau.dev"
          "color-picker@tuberry"
        ];
        favorite-apps = [
          "firefox.desktop"
          "org.gnome.Nautilus.desktop"
        ];
      };
      "org/gnome/shell/extensions/appindicator" = {
        icon-saturation = 1.0;
      };
      "org/gnome/shell/extensions/clipboard-history" = {
        display-mode = 3; # no icon in status bar
        toggle-menu = ["<Super>v"];
        toggle-private-mode = [];
      };
      "org/gnome/shell/extensions/color-picker" = {
        color-picker-shortcut = ["<Super>c"];
        enable-shortcut = true;
        enable-systray = false;
        menu-key = "c";
      };
      "org/gnome/shell/overrides" = {
        button-layout = "minimize,maximize,close:";
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
