{pkgs, ...}: {
  home.packages = with pkgs; [
    nodejs_21
    corepack_21

    python313
    # python311Packages.pip

    jdk21

    clang
    rustup

    unstable.jetbrains.idea-ultimate
    unstable.jetbrains.rust-rover
  ];
}
