{lib,...}: {
  services.openssh = {
    enable = lib.mkDefault false;
    settings = {
      # Forbid root login through SSH.
      PermitRootLogin = lib.mkDefault "no";
      # Use keys only. Remove if you want to SSH using password (not recommended)
      PasswordAuthentication = lib.mkDefault false;
    };
    ports = [22];
    banner = ''
      NICE BANNER, BRO!
    '';
  };
}
