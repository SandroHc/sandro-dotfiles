{...}: {
  dconf = {
    enable = true;

    # See settings with: dconf dump /

    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

    # Enable fractional scaling
    settings."org/gnome/mutter".experimental-features = "['scale-monitor-framebuffer']";
  };
}
