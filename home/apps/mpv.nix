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
      # Audio
      alang = "jp,jap,en,eng,pt,por"; # default audio languages

      # Subtitles
      slang = "en,eng,pt,por"; # default subtitles languages
      sub-auto = "fuzzy";
      sub-file-paths = "subs/\${filename/no-ext}:subs/\${filename}:subs";
      # sub-font-size = 45;
      # sub-font = "Arial";
      demuxer-mkv-subtitle-preroll = "yes"; # preload subtitles while seeking
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
    present-window-on-file-open = true;

    # Make Celluloid read the config and bindings
    mpv-config-enable = true;
    mpv-config-file = "file://${config.home.homeDirectory}/${config.xdg.configFile."mpv/mpv.conf".target}";
    mpv-input-config-enable = true;
    mpv-input-config-file = "file://${config.home.homeDirectory}/${config.xdg.configFile."mpv/input.conf".target}";
  };
}
