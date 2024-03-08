{pkgs, ...}: {
  home.packages = with pkgs; [
    nodejs_21
    corepack_21

    python313
    # python311Packages.pip

    gradle

    clang
    rustup

    unstable.jetbrains.idea-ultimate
    unstable.jetbrains.rust-rover
  ];

  programs.java = {
    enable = true; # sets JAVA_HOME
    package = pkgs.jdk17;
  };
}
