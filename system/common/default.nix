{
  self,
  pkgs,
  ...
}: {
  imports = [
    ./bootloader.nix
    ./home-manager.nix
    ./locale.nix
    ./network.nix
    ./user.nix
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.11";

  environment = {
    defaultPackages = [];
    systemPackages = with pkgs; [
      git
      alejandra
    ];
  };

  nix = {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = let
      unstable-packages = final: _prev: {
        unstable = import self.inputs.nixpkgs-unstable {
          system = final.system;
          config.allowUnfree = true;
        };
      };
    in [
      unstable-packages
      self.inputs.nur.overlay
    ];
  };
}
