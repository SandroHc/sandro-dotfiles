{pkgs, ...}: let
  en = "en_US.UTF-8";
  pt = "pt_PT.UTF-8";
in {
  time.timeZone = "Europe/Lisbon";

  i18n = {
    defaultLocale = en;
    extraLocaleSettings = {
      LANG = en;
      LC_COLLATE = en;
      LC_CTYPE = en;
      LC_MESSAGES = en;

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

    # Enables ibus IME with Japanese support
    # Useful commands:
    #  - ibus-daemon -d
    #  - ibus-setup
    inputMethod = {
      enabled = "ibus";
      ibus.engines = with pkgs.ibus-engines; [
        mozc
      ];
    };
  };

  console.keyMap = "pt-latin1";
}
