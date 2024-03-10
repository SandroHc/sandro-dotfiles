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
    dates = "Fri 23:00"; # https://www.mankier.com/7/systemd.time
    randomizedDelaySec = "30min";
  };
}
