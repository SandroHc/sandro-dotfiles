{pkgs, ...}: {
  home.packages = with pkgs; [
    nodejs_21
    corepack_21

    python313
    python311Packages.pip

    jdk21

    clang
    rustup

    jetbrains.idea-ultimate
    jetbrains.rust-rover
  ];
}
