{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./debloat.nix
    ./mimetypes.nix
  ];

  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
  ];

  services.udev.packages = with pkgs; [
    gnome.gnome-settings-daemon
  ];
}
