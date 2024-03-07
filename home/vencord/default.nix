{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    unstable.vesktop
  ];

  # xdg.configFile."VencordDesktop/VencordDesktop/themes/self.theme.css".source = ./theme.css;

  # xdg.configFile."VencordDesktop/VencordDesktop/settings.json".text = builtins.toJSON {
  # };

  # xdg.configFile."VencordDesktop/VencordDesktop/settings/settings.json".text = builtins.toJSON {
  # };
}
