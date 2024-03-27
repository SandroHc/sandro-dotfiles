{...}: {
  networking.firewall = {
    allowedTCPPorts = [3389];
    allowedUDPPorts = [3389];
  };
}
