{self, ...}: {
  # Tips:
  # - see next scheduled run: systemctl status nixos-upgrade.timer
  # - see logs of last run: systemctl status nixos-upgrade.service
  system.autoUpgrade = {
    enable = true;
    flake = self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L" # print build logs
    ];
    dates = "friday 23:00";
    randomizedDelaySec = "30min";
  };
}
