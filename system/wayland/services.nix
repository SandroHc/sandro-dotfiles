{pkgs, ...}: {
  services = {
#    # Enable the X11 windowing system.
#    services.xserver = {
#      enable = true;
#      layout = "pt";
#      xkbVariant = "";
#    };

    # Enable CUPS to print documents
    printing.enable = true;
  };
}
