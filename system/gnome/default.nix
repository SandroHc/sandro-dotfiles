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
    gnomeExtensions.color-picker
  ];

  services.udev.packages = with pkgs; [
    gnome.gnome-settings-daemon
  ];
}
