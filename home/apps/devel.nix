{pkgs, ...}: {
  home.packages = with pkgs; [
    # languages and tooling
    python313
    # python311Packages.pip

    clang
    rustup

    gradle

    nodejs_21
    corepack_21

    # editors
    unstable.jetbrains.idea-ultimate
    unstable.jetbrains.rust-rover
    unstable-zed.zed-editor # WIP: https://github.com/NixOS/nixpkgs/pull/284010, https://github.com/zed-industries/zed/issues/7015
  ];

  programs.java = {
    enable = true; # sets $JAVA_HOME
    package = pkgs.jdk17;
  };

  # virtualisation = {
  #   docker = {
  #     enable = true;
  #     # storageDriver = "btrfs";
  #   };
  # };
}
