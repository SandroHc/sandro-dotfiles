{ pkgs, lib, config, ... }: {
  networking = {
    nameservers = ["1.1.1.1" "1.0.0.1"];
    networkmanager = {
      enable = true;
    };
    firewall = {
      enable = true;
      # allowedTCPPorts = [];
      # allowedUDPPorts = [];
    };
    # proxy = {
    #   default = "http://user:password@proxy:port/";
    #   noProxy = "127.0.0.1,localhost,internal.domain";
    # };
  };
}
