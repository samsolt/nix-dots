{
  inputs,
  config,
  pkgs,
  ...
}: {
  home.username = "samik";
  home.homeDirectory = "/home/samik";
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    settings = import ./hyprland.nix;
  };
  services.hyprpaper.enable = true;
  programs.hyprlock = {
    enable = true;
    settings = {
      background = {
        blur_passes = 2;
        blur_size = 4;
      };
      label = {
        text = "$TIME";
        font_size = 150;
        position = "0, 250";
        halign = "center";
        valign = "center";
      };
    };
  };

  home.packages = with pkgs; [
    blender
    davinci-resolve
    discord
    gimp
    file-roller
    filezilla
    gimp
    inkscape
    jellyfin-media-player
    kdePackages.kdenlive
    krita
    libreoffice-qt6
    loupe
    nautilus
    nicotine-plus
    obs-cmd
    obsidian
    osu-lazer-bin
    picard
    prismlauncher
    qbittorrent
    spek
    steam-rom-manager
    superfile
    superTuxKart
    tetrio-desktop
    umu-launcher
    vesktop
    wootility
    hyprpicker
  ];

  stylix = {
    enable = true;
    image = ./wallpaper.png;
    polarity = "dark";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
    opacity.terminal = 0.6;
   iconTheme = {
     enable = true;
     package = pkgs.adwaita-icon-theme;
      dark = "Adwaita";
      light = "Adwaita";
   };
    fonts = {
      sansSerif = {
        name = "Inter Nerd Font";
        package = pkgs.inter-nerdfont;
      };
      monospace = {
        name = "Maple Mono NF";
        package = pkgs.maple-mono.NF;
      };
    };
    targets = {
      #      hyprland.enable = false;
      #      hyprpaper.enable = false;
      mangohud.enable = false;
      vscode.profileNames = ["default"];
      waybar.font = "monospace";
      firefox.profileNames = ["l3awtpxv"]; # tohle se urcite eventualne rozjebe
    };
  };
  programs = {
    lutris.enable = true;
    obs-studio = {
      enable = true;
      plugins = [pkgs.obs-studio-plugins.obs-vaapi];
    };
    mangohud.enable = true;
    rofi.enable = true;
    fish = {
      enable = true;
      loginShellInit = "Hyprland";
      shellInit = "
        function rebuild;
        cp -r ~/gitsysconfig/ ~/sysconfig/
        rm -rf ~/sysconfig/.git*
        sudo nixos-rebuild switch --flake ~/sysconfig
        rm -rf ~/sysconfig/; end
      ";
    };
    mpv = {
      enable = true;
      scripts = [pkgs.mpvScripts.mpris];
    };
    looking-glass-client = {
      enable = true;
      settings = import ./app-config/looking-glass.ini;
    };
    vscode = {
      enable = true;
      profiles.default = {
        extensions = [
          pkgs.vscode-extensions.jnoortheen.nix-ide
          pkgs.vscode-extensions.ms-vscode.cpptools
          pkgs.vscode-extensions.ms-vscode.cpptools-extension-pack
        ];
        userSettings = {
          "editor.largeFileOptimizations" = "false";
          "C_Cpp.default.compilerPath" = "/run/current-system/sw/bin/g++";
        };
      };
    };
    firefox.enable = true;
    kitty = {
      enable = true;
      settings = {
        confirm_os_window_close = 0;
        cursor_trail = 10;
      };
    };
    waybar = {
      enable = true;
      settings = import ./waybar/config.nix;
      systemd.enable = true;
    };
  };

  xdg.desktopEntries = {
    osu = {
      name = "osu!";
      genericName = "osu! na dGPU";
      icon = "osu";
      exec = "nvidia-offload osu! %u";
      mimeType = ["application/x-osu-beatmap-archive" "application/x-osu-skin-archive" "application/x-osu-beatmap" "application/x-osu-storyboard" "application/x-osu-replay" "x-scheme-handler/osu"];
      categories = ["Game"];
    };
    blender = {
      name = "Blender";
      genericName = "Blender na dGPU";
      icon = "blender";
      exec = "nvidia-offload blender %f";
      mimeType = ["application/x-blender"];
      categories = ["Graphics" "3DGraphics"];
    };
    tetrio= {
      name = "TETR.IO";
      genericName = "TETR.IO na dGPU";
      icon = "TETR.IO";
      exec = "nvidia-offload tetrio %U";
      mimeType = ["x-scheme-handler/tetrio"];
    };
  };
  nixpkgs.config.allowUnfree = true;
}
