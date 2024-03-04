{pkgs, lib, ...}: {
  environment.variables = {
    EDITOR = "nvim";
  };
  environment.systemPackages = with pkgs; [
    git
  ];

  time.timeZone = "Europe/Lisbon";

  i18n = let
    defaultLocale = "en_US.UTF-8";
    pt = "pt_PT.UTF-8";
  in {
    inherit defaultLocale;
    extraLocaleSettings = {
      LANG = defaultLocale;
      LC_COLLATE = defaultLocale;
      LC_CTYPE = defaultLocale;
      LC_MESSAGES = defaultLocale;

      LC_ADDRESS = pt;
      LC_IDENTIFICATION = pt;
      LC_MEASUREMENT = pt;
      LC_MONETARY = pt;
      LC_NAME = pt;
      LC_NUMERIC = pt;
      LC_PAPER = pt;
      LC_TELEPHONE = pt;
      LC_TIME = pt;
    };
  };
  
  console.keyMap = "pt-latin1";

  security.rtkit.enable = true;
}
