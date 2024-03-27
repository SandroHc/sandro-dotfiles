{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  # boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = ["btrfs"];
  hardware.enableAllFirmware = true;
  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable Gnome
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  networking.hostName = "sandro";
  networking.networkmanager.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’
  users.users.sandro = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  system.stateVersion = "23.11";
}
