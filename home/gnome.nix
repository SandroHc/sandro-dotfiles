{...}: {
  dconf = {
    enable = true;

    # See settings with: dconf dump /
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };
}
