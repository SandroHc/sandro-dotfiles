{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      # material-icons
      # material-design-icons
      # roboto
      # work-sans
      # comic-neue
      # source-sans
      # twemoji-color-font
      # comfortaa
      # inter
      # lato
      lexend
      # jost
      dejavu_fonts
      iosevka-bin
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      jetbrains-mono
      (nerdfonts.override {fonts = ["Iosevka" "JetBrainsMono"];})

      # japanese fonts
      ipafont
      kochi-substitute
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [
          "Iosevka Term"
          "Iosevka Term Nerd Font Complete Mono"
          "Iosevka Nerd Font"
          "IPAGothic" # japanese fallback
          # "Noto Color Emoji"
        ];
        sansSerif = [
          "Lexend"
          # "Noto Color Emoji"
          "IPAPGothic" # japanese fallback
        ];
        serif = [
          "Noto Serif"
          # "Noto Color Emoji"
        ];
        emoji = ["Noto Color Emoji"];
      };
    };
  };
}
