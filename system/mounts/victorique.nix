{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = [pkgs.cifs-utils]; # Needed for domain resolution
  fileSystems."/mnt/victorique" = {
    device = "//victorique/archives";
    fsType = "cifs";
    options = [
      "x-systemd.automount"
      "x-systemd.idle-timeout=60"
      "x-systemd.device-timeout=5s"
      "x-systemd.mount-timeout=5s"
      "noauto"
      "uid=${toString config.users.users.sandro.uid}"
      # "credentials=/etc/nixos/system/mounts/victorique-creds"
      # "username=foo"
      # "password=bar"
    ];
  };
}
