{
  config,
  pkgs,
  ...
}: {
  programs.mpv = {
    enable = true;
    package = pkgs.celluloid;

    # Based on: https://github.com/hl2guide/better-mpv-config/blob/master/mpv_v3/mpv.conf
    config = {
      save-position-on-quit = true; # saves the seekbar position on exit
      force-seekable = true; # forces videos to be seekable

      # Subtitles
      alang = "jp,jap,en,eng"; # default audio languages
      embeddedfonts = true; # use embedded fonts for SSA/ASS subs
      slang = "en,eng,pt,por"; # default subtitles languages
      # sid = "auto"; # automatically play subtitles that match the language and audio track
      sub-auto = "fuzzy";
      sub-file-paths = "subs/\${filename/no-ext}:subs/\${filename}:subs";
      # sub-fix-timing = false; # do not try to fix gaps (which might make it worse in some cases)
      # sub-font-size = 45;
      # sub-font = "Arial";
    };

    # Keybindings testing mode: mpv --input-test --force-window --idle (Use your CMD, Test Keybinds)
    # MPC-HC keybindings: https://github.com/dragons4life/MPC-HC-config-for-MPV/blob/master/input.conf
    bindings = {
      # Basics
      SPACE = "cycle pause"; # pause/unpause
      MBTN_RIGHT = "cycle pause"; # pause/unpause (with left click)
      "Alt+ENTER" = "cycle fullscreen"; # fullscreen/un-fullscreen (with double left click)
      # MBTN_LEFT_DBL = "cycle fullscreen"; # fullscreen/un-fullscreen
      "Alt+x" = "quit-watch-later"; # quit and save position
      "1" = "cycle border"; # cycle between no titlebar/ "View Minimal in mpc-hc"
      n = "show-text \${filename}"; # show filename
      ENTER = "show-progress";

      # Video
      LEFT = "osd-msg-bar seek -5 relative+keyframes";
      RIGHT = "osd-msg-bar seek +5 relative+keyframes";
      "Shift+LEFT" = "osd-msg-bar seek -1 relative+exact";
      "Shift+RIGHT" = "osd-msg-bar seek +1 relative+exact";
      PGUP = "playlist-next; write-watch-later-config"; # skip to next file
      PGDWN = "playlist-prev; write-watch-later-config"; # skip to previous file
      "Alt+i" = "screenshot"; # take a screenshot

      # Audio
      UP = "add volume +5"; # increase volume
      DOWN = "add volume -5"; # decrease volume
      WHEEL_UP = "add volume +5"; # increase volume
      WHEEL_DOWN = "add volume -5"; # decrease volume
      a = "cycle audio"; # next audio track
      "Shift+a" = "cycle audio down"; # prev audio track
      m = "cycle mute"; # mute/unmute

      # Subtitles
      s = "cycle sub"; # next subtitles
      "Shift+s" = "cycle sub down"; # previous subtitles
      w = "cycle sub-visibility"; # toggle subtitles

      # Frame-Step
      "." = "frame-step; show-text \"Frame: \${estimated-frame-number} / \${estimated-frame-count}\""; # next frame
      "," = "frame-back-step; show-text \"Frame: \${estimated-frame-number} / \${estimated-frame-count}\""; # previous frame
    };
  };

  dconf.settings."io/github/celluloid-player/celluloid" = {
    draggable-video-area-enable = true;
    last-folder-enable = true;

    # Make Celluloid read the config and bindings
    mpv-config-enable = true;
    mpv-config-file = "file://${config.home.homeDirectory}/${config.xdg.configFile."mpv/mpv.conf".target}";
    mpv-input-config-enable = true;
    mpv-input-config-file = "file://${config.home.homeDirectory}/${config.xdg.configFile."mpv/input.conf".target}";
  };
}
