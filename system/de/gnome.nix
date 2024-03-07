{pkgs, ...}: {
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    # layout = "pt";
    # xkbVariant = "";
    excludePackages = with pkgs; [
      xterm
    ];
  };

  # Disable Gnome applications
  environment.gnome.excludePackages =
    (with pkgs; [
      # gnome-photos
      gnome-tour
    ])
    ++ (with pkgs.gnome; [
      # cheese # webcam tool
      # gnome-music
      # gnome-terminal
      # gedit # text editor
      epiphany # web browser
      geary # email reader
      # evince # document viewer
      gnome-characters
      gnome-font-viewer
      gnome-maps
      totem # video player
      # tali # poker game
      # iagno # go game
      # hitori # sudoku game
      # atomix # puzzle game
    ]);
}
