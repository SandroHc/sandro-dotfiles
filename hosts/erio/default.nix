{self, ...}: {
  imports = [
    self.inputs.nixos-hardware.nixosModules.common-pc-laptop
    self.inputs.nixos-hardware.nixosModules.common-pc-laptop-ssd
    self.inputs.nixos-hardware.nixosModules.common-cpu-intel
    self.inputs.nixos-hardware.nixosModules.common-gpu-nvidia
    ./hardware-configuration.nix
    ../../system/common
    ../../system/graphical
    ../../system/gnome
    ../../system/ssh.nix
    ../../system/auto-updates.nix
  ];

  networking.hostName = "erio";
  security.rtkit.enable = true;
  services.printing.enable = true; # Enable CUPS to print documents
}
