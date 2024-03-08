{self, ...}: {
  imports = [
    self.inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t470s
    ./hardware-configuration.nix
    ../../system/common
    ../../system/graphical
    ../../system/gnome
    ../../system/ssh.nix
    # ../../system/mounts/victorique.nix
  ];

  networking.hostName = "hanekawa";
  security.rtkit.enable = true;
  services.printing.enable = true; # Enable CUPS to print documents
}
