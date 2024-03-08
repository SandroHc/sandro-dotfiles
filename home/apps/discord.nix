{pkgs, ...}: {
  # TODO: move back to stable after migrating to nixpkgs 24.05
  home.packages = with pkgs; [
    unstable.vesktop
  ];

  xdg.configFile."vesktop/settings.json".text = builtins.toJSON {
    minimizeToTray = "on";
    discordBranch = "stable";
    arRPC = "on";
    splashColor = "rgb(219, 222, 225)";
    splashBackground = "rgb(49, 51, 56)";
  };

  xdg.configFile."vesktop/settings/settings.json".text = builtins.toJSON {
    notifyAboutUpdates = false;
    autoUpdate = false;
    autoUpdateNotification = true;
    useQuickCss = true;
    themeLinks = ["https://luckfire.github.io/amoled-cord/src/amoled-cord.css"];
    enabledThemes = ["personal.css"];
    enableReactDevtools = false;
    frameless = false;
    transparent = false;
    winCtrlQ = false;
    disableMinSize = true;
    winNativeTitleBar = false;
    plugins = {
      BadgeAPI.enabled = true;
      ChatInputButtonAPI.enabled = true;
      CommandsAPI.enabled = true;
      ContextMenuAPI.enabled = true;
      MessageEventsAPI.enabled = true;
      MessagePopoverAPI.enabled = true;
      NoticesAPI.enabled = true;
      NoTrack.enabled = true;
      Settings = {
        enabled = true;
        settingsLocation = "aboveActivity";
      };
      SupportHelper.enabled = true;
      CrashHandler = {
        enabled = true;
        attemptToPreventCrashes = true;
        attemptToNavigateToHome = false;
      };
      # Experiments = {
      #   enabled = true;
      #   enableIsStaff = false;
      # };
      FakeNitro = {
        enabled = true;
        enableEmojiBypass = true;
        emojiSize = 48;
        transformEmojis = true;
        enableStickerBypass = true;
        stickerSize = 160;
        transformStickers = true;
        transformCompoundSentence = false;
        enableStreamQualityBypass = true;
        useHyperLinks = true;
      };
      FavoriteEmojiFirst.enabled = true;
      ImageZoom = {
        enabled = true;
        saveZoomValues = true;
        invertScroll = true;
        nearestNeighbour = false;
        square = false;
        zoom = 2;
        size = 100;
        zoomSpeed = 0.5;
      };
      MessageLogger = {
        enabled = true;
        deleteStyle = "text";
        ignoreBots = false;
        ignoreSelf = false;
        ignoreUsers = "";
        ignoreChannels = "";
        ignoreGuilds = "";
      };
      PermissionsViewer = {
        enabled = true;
        permissionsSortOrder = 0;
        defaultPermissionsDropdownState = false;
      };
      RelationshipNotifier = {
        enabled = true;
        notices = true;
        offlineRemovals = true;
        friends = true;
        friendRequestCancels = true;
        servers = true;
        groups = true;
      };
      SendTimestamps = {
        enabled = true;
        replaceMessageContents = true;
      };
      ShowHiddenChannels = {
        enabled = true;
        hideUnreads = true;
        showMode = 0;
        defaultAllowedUsersAndRolesDropdownState = true;
      };
      ViewRaw.enabled = true;
      # WebContextMenus = {
      #   enabled = true;
      #   addBack = true;
      # };
      # WebKeybinds.enabled = true;
    };
    notifications = {
      timeout = 5000;
      position = "bottom-right";
      useNative = "not-focused";
      logLimit = 50;
    };
  };

  xdg.configFile."vesktop/themes/personal.css".text = ''
    /**
     * @name Personal
     * @author SandroHc
     * @version 1.0.0
     * @description Sandro's personal styles.
     * @source https://github.com/SandroHc/sandro-dotfiles/home/vencord.nix
     */

    /* chat box */
    button[aria-label="Send a gift"],
    button[aria-label="Open sticker picker"] {
        display: none;
    }

    /* sidebar */
    /** sidebar server boosts */
    div[aria-label="This server has unlocked all Boosting perks!"] {
        display: none;
    }
    /** sidebar banner */
    div[class*="animatedContainer"] {
        display: none;
    }
    /** sidebar spacer after banner */
    ul[aria-label="Channels"] > div:nth-child(1),
    ul[aria-label="Channels"] > div:nth-child(2) {
        display: none;
    }
    /** sidebar "Show All" voice channels button */
    div[role="button"][class*="voiceChannelsButton"] {
        display: none;
    }

    /* top bar */
    /** remove Notification Settings */
    section[aria-label="Channel header"] div[aria-label="Notification Settings"] {
        display: none;
    }
    /** remove Help/Submit Bug Report */
    section[aria-label="Channel header"] div[aria-label="Help"] {
        display: none;
    }

    /* role colours */
    /** black color */
    span[style*="color: rgb(8, 8, 8)"] { color: #9f9f9f !important; }
    /** red color */
    span[style*="color: rgb(201, 0, 0)"] { color: #eb9595 !important; }
    /** grey color */
    /*span[style*="color: rgb(141, 141, 141)"] { color: #9f9f9f !important; }*/
    /** blue color */
    /*span[style*="color: rgb(32, 102, 148)"] { color: #8ebddb !important; }*/

    /* friends view */
    /** nitro button */
    a[data-list-item-id="private-channels-uid_18___nitro"] {
        display: none;
    }
    /** shop button */
    a[data-list-item-id="private-channels-uid_18___shop"] {
        display: none;
    }
  '';
}
