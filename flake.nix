# NixOS configuration entrypoint
# Available through 'nixos-rebuild --flake .#your-hostname'
{
  description = "Sandro's Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    impermanence.url = "github:nix-community/impermanence/master";
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixos-hardware,
    ...
  }: {
    nixosConfigurations = {
      erio = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self;};
        modules = [./hosts/erio];
      };

      hanekawa = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self;};
        modules = [./hosts/hanekawa];
      };

      kurisu = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self;};
        modules = [./hosts/kurisu];
      };
    };
  };
}
