# rclone setup for cloud sync and backups.
# Use `rclone config` for initial setup.
#
# Useful links:
# - Google Drive: https://rclone.org/drive/#making-your-own-client-id
# - Mega: https://rclone.org/mega/
# - OneDrive: https://rclone.org/onedrive/#getting-your-own-client-id-and-key
{
  config,
  pkgs,
  ...
}: let
  rcloneMount = name: let
    mountDir = "${config.home.homeDirectory}/cloud/${name}";
  in {
    Unit = {
      Description = "rclone mount for ${name}";
      After = ["network-online.target"];
      Wants = ["network-online.target"];
    };
    Install = {
      WantedBy = ["default.target"];
    };
    Service = {
      Type = "notify";
      ExecStartPre = "/run/current-system/sw/bin/mkdir -p ${mountDir}";
      ExecStart = "${pkgs.rclone}/bin/rclone mount ${name}: ${mountDir} --vfs-cache-mode full";
      ExecStop = "/run/current-system/sw/bin/fusermount -u ${mountDir}";
      Restart = "on-failure";
      RestartSec = "10s";
      Environment = ["PATH=/run/wrappers/bin/:$PATH"];
    };
  };
in {
  home.packages = with pkgs; [
    rclone
  ];

  systemd.user.services.rclone-gdrive = rcloneMount "gdrive";
  systemd.user.services.rclone-mega = rcloneMount "mega";
  systemd.user.services.rclone-onedrive = rcloneMount "onedrive";
}
