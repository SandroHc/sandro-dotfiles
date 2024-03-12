{...}: {
  networking = {
    nameservers = ["1.1.1.1" "1.0.0.1"]; # CloudFlare DNS
    networkmanager = {
      enable = true;
    };

    firewall = {
      enable = true;
      allowPing = true;
    };

    # proxy = {
    #   default = "http://user:password@proxy:port/";
    #   noProxy = "127.0.0.1,localhost,internal.domain";
    # };
  };

  # Make this host discoverable to Windows machines
  services.samba.enable = true;
}
