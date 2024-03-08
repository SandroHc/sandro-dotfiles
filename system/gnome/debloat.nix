{
  pkgs,
  lib,
  ...
}: {
  services = {
    xserver.excludePackages = with pkgs; [
      xterm
    ];

    gnome = {
      gnome-initial-setup.enable = false;
      gnome-online-accounts.enable = false;
      gnome-online-miners.enable = lib.mkForce false;
      gnome-user-share.enable = false;
    };
  };

  environment.gnome.excludePackages = with pkgs; [
    # gnome-photos
    gnome-tour
    # gnome.cheese # webcam tool
    # gnome.gnome-music
    # gnome.gnome-terminal
    # gnome.gedit # text editor
    gnome.epiphany # web browser
    gnome.geary # email reader
    # gnome.evince # document viewer
    gnome.gnome-characters
    gnome.gnome-font-viewer
    gnome.gnome-maps
    gnome.totem # video player
    gnome.yelp # help viewer
  ];
}
