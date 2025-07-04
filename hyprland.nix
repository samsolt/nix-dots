{
  monitor = ",1920x1080@144,0x0,1";

  env = [
    "AQ_DRM_DEVICES,/dev/dri/card1"
    "NIXOS_OZONE_WL,1"
  ];

  exec-once = [
    "asusctl profile -P quiet&&brightnessctl set 0&& hyprlock &&asusctl profile -P performance&&brightnessctl set 24000"
    #    "obs --startreplaybuffer"
    "systemctl --user start hyprpolkitagent.service"
    "qbittorrent"
  ];

  general = {
    gaps_in = "4";
    gaps_out = "6";
    border_size = "2";
    #    "col.active_border" = "rgba(ffffffff)";
    #    "col.inactive_border" = "rgba(00000000)";
    allow_tearing = "false";
    layout = "dwindle";
  };

  decoration = {
    rounding = "15";
    active_opacity = "1.0";
    inactive_opacity = "0.9";
    fullscreen_opacity = "1.0";
    shadow = {
      enabled = "false";
      range = "16";
      render_power = "3";
    };
    blur = {
      enabled = "true";
      size = "1";
      passes = "1";
      vibrancy = "1.0";
    };
  };
  render = {
    direct_scanout = "0";
  };

  windowrulev2 = [
    "float, class:mpv"
    "float, class:org.gnome.FileRoller"

    "suppressevent maximize, class:.*"
    "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
  ];

  # animations = {
  #   bezier = [
  #     "easeInOutCirc, 0.85, 0, 0.15, 1"
  #   ];
  #   animation = [
  #     "global, 1, 3, easeInOutCirc"
  #     "specialWorkspace, 1, 3, easeInOutCirc, slidevert"
  #   ];
  # };
  animations = {
    bezier = [
      "wind, 0.05, 0.9, 0.1, 1"
      "winIn, 0.1, 1.1, 0.1, 1"
      "winOut, 0.3, -0.3, 0, 1"
      "liner, 1, 1, 1, 1"
    ];
    animation = [
      "windows, 1, 6, wind, slide"
      "windowsIn, 1, 6, winIn, slide"
      "windowsOut, 1, 5, winOut, slide"
      "windowsMove, 1, 5, wind, slide"
      "border, 1, 1, liner"
      "fade, 1, 2, default"
      "workspaces, 1, 5, wind"
      "specialWorkspace, 1, 5, wind, slidevert"
    ];
  };
  dwindle = {
    preserve_split = "true"; # You probably want this
  };

  misc = {
    force_default_wallpaper = "2";
    middle_click_paste = "false";
  };

  input = {
    kb_layout = "us,cz,ru";
    kb_variant = ",qwerty,phonetic";
    kb_options = "grp:alt_shift_toggle";

    follow_mouse = "1";

    sensitivity = "0";
    accel_profile = "flat";

    touchpad = {
      natural_scroll = "true";
      scroll_factor = "0.2";
    };
  };

  bind = [
    "super, t, exec, kitty"
    "super, q, killactive,"
    "super, E, exec, nautilus"
    "super, V, togglefloating,"
    "super, J, togglesplit,"
    "super, g, exec, lutris"
    ", XF86HomePage, exec, firefox"
    "alt, g, exec, obs-cmd replay save"
    "super, l, exec, asusctl profile -P quiet&&brightnessctl set 0&& hyprlock &&asusctl profile -P performance&&brightnessctl set 24000"
    "super, h, exec, hyprpicker -a"
    ", print, exec, hyprshot -m region --clipboard-only --freeze"
    "super, c, fullscreen, 1"
    "super, x, fullscreen, 0"
    "control shift, escape, exec, kitty btop"
    "super, left, movefocus, l"
    "super, right, movefocus, r"
    "super, up, movefocus, u"
    "super, down, movefocus, d"
    "shift super, left, movewindow, l"
    "shift super, right, movewindow, r"
    "shift super, up, movewindow, u"
    "shift super, down, movewindow, d"
    "super, 1, workspace, 1"
    "super, 2, workspace, 2"
    "super, 3, workspace, 3"
    "super, 4, workspace, 4"
    "super, 5, workspace, 5"
    "super, 6, workspace, 6"
    "super, 7, workspace, 7"
    "super, 8, workspace, 8"
    "super, 9, workspace, 9"
    "super, 0, workspace, 10"
    "super SHIFT, 1, movetoworkspace, 1"
    "super SHIFT, 2, movetoworkspace, 2"
    "super SHIFT, 3, movetoworkspace, 3"
    "super SHIFT, 4, movetoworkspace, 4"
    "super SHIFT, 5, movetoworkspace, 5"
    "super SHIFT, 6, movetoworkspace, 6"
    "super SHIFT, 7, movetoworkspace, 7"
    "super SHIFT, 8, movetoworkspace, 8"
    "super SHIFT, 9, movetoworkspace, 9"
    "super SHIFT, 0, movetoworkspace, 10"
    "super, S, togglespecialworkspace, magic"
    "super SHIFT, S, movetoworkspace, special:magic"
    "alt, tab, cyclenext"
    "alt, grave, cyclenext"
    #    "alt, tab, alterzorder, top"
    "super, mouse_down, workspace, e+1"
    "super, mouse_up, workspace, e-1"
  ];
  bindr = "super, super_l, exec, rofi -show drun";

  binde = [
    "control super, left, resizeactive, -20 0"
    "control super, right, resizeactive, 20 0"
    "control super, up, resizeactive, 0 -20"
    "control super, down, resizeactive, 0 20"
  ];

  bindm = [
    "super, mouse:272, movewindow"
    "super, mouse:273, resizewindow"
  ];

  bindel = [
    ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
    ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
    ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
    ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
  ];

  bindl = [
    ", XF86AudioNext, exec, playerctl next"
    ", XF86AudioPause, exec, playerctl play-pause"
    ", XF86AudioPlay, exec, playerctl play-pause"
    ", XF86AudioPrev, exec, playerctl previous"
    ", XF86Tools, exec, mpv --shuffle --no-audio-display /home/samik/Music"
  ];
}
