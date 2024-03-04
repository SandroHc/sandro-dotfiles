{nixpkgs, self, ...}: let
  inputs = self.inputs;

  core = ../system/core;
  bootloader = ../system/core/bootloader.nix;
  wayland = ../system/wayland;
  gnome = ../system/de/gnome.nix;
  homeManagerModule = inputs.home-manager.nixosModules.home-manager;

  shared = [core];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs;
      inherit self;
    };
#    users.sandro = {
#      imports = [../home];
#    };
    users.sandro = import ../home;
  };
in {
  kurisu = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      {networking.hostName = "kurisu";}
      ./kurisu
      bootloader
      wayland
      gnome
      homeManagerModule
      {inherit home-manager;}
    ] ++ shared;
    specialArgs = {inherit inputs;};
  };

  hanekawa = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      {networking.hostName = "hanekawa";}
      ./hanekawa
      bootloader
      wayland
      gnome
      homeManagerModule
      {inherit home-manager;}
    ] ++ shared;
    specialArgs = {inherit inputs;};
  };
}

