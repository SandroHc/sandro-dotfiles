{self, ...}: {
  imports = [
    self.inputs.nixos-hardware.nixosModules.common-pc
    self.inputs.nixos-hardware.nixosModules.common-pc-ssd
    self.inputs.nixos-hardware.nixosModules.common-cpu-intel
    self.inputs.nixos-hardware.nixosModules.common-gpu-nvidia-nonprime
    ./hardware-configuration.nix
    ../../system/common
    ../../system/graphical
    ../../system/gnome
    ../../system/services/ssh.nix
    ../../system/services/rdp.nix
    ../../system/auto-updates.nix
  ];

  networking.hostName = "kurisu";
  security.rtkit.enable = true;
  services.printing.enable = true; # Enable CUPS to print documents
}
