{...}: {
  programs.firefox = {
    enable = true;
    # languagePacks = ["en-US" "pt-PT"];

    profiles."sandro" = {
      id = 0;
      isDefault = true;
    };

    # Check 'about:policies#documentation' for options
    # Read more: https://mozilla.github.io/policy-templates/
    policies = let
      lock-false = {
        Value = false;
        Status = "locked";
      };
      lock-true = {
        Value = true;
        Status = "locked";
      };
      lock-empty-string = {
        Value = "";
        Status = "locked";
      };
    in {
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisplayBookmarksToolbar = "always";
      DontCheckDefaultBrowser = true;

      # Check 'about:config' for options
      Preferences = {
        "browser.aboutConfig.showWarning" = false;
        "browser.warnOnQuitShortcut" = false;
        "findbar.highlightAll" = true;
        # "identity.fxaccounts.account.device.name" = hostname.toUpperCase;
      };

      # Check 'about:support' for extension ID strings.
      # Valid values for 'installation_mode' are: allowed, blocked, force_installed, normal_installed
      # Read more: https://mozilla.github.io/policy-templates/#extensionsettings
      ExtensionSettings = {
        # Auto Tab Discard			{c2c003ee-bd69-42a2-b0e9-6f34222cb046}
        # Consent-O-Matic			gdpr@cavi.au.dk
        # Dark Reader				addon@darkreader.org
        # Decentraleyes				jid1-BoFifL9Vbdl2zQ@jetpack
        # Privacy Badger			jid1-MnnxcxisBPnSXQ@jetpack
        # Return YouTube Dislike	e{762f9885-5a13-4abd-9c77-433dcd38b8fd}
        # Reverse Image Search		{0da2e603-21ba-4422-8049-b6d9e013ed84}
        # SponsorBlock				sponsorBlocker@ajay.app
        # uBlock Origin
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "normal_installed";
        };
        # Violentmonkey				{aecec67f-0d10-4fa7-b7c7-609a2db280cf}
        # Yomitan					{6b733b82-9261-47ee-a595-2dda294a4d08}

        # Svelte Devtools			{a0370179-acc3-452f-9530-246b6adb2768}
      };
    };
  };
}
