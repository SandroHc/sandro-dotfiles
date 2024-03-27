{self, ...}: {
  imports = [
    self.inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t470s
    ./hardware-configuration.nix
    ../../system/common
    ../../system/graphical
    ../../system/gnome
    ../../system/services/ssh.nix
    ../../system/services/rdp.nix
    ../../system/auto-updates.nix
    # ../../system/mounts/victorique.nix
  ];

  networking.hostName = "hanekawa";
  security.rtkit.enable = true;
  services.printing.enable = true; # Enable CUPS to print documents

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };
}
