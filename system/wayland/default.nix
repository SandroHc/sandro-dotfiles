{pkgs,...}: {
  imports = [
    ./fonts.nix
    ./pipewire.nix
    ./services.nix
  ];

  environment = {
    variables = {
    };
  };
}
