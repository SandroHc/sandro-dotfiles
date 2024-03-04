{...}: {
  imports = [
    ./zsh.nix
    ./git.nix
    ./packages.nix
  ];

  home.sessionVariables = {
    EDITOR = "neovim";
  };
}
