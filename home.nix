{ inputs, config, pkgs, ... }: 

{
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
    kdePackages.dolphin
    filezilla
    gimp
    inkscape
    jellyfin-media-player
    kdePackages.kdenlive
    kdePackages.ark
    libreoffice-qt6
    loupe
    nicotine-plus
    obs-cmd
    obsidian
    osu-lazer-bin
    picard
    prismlauncher
    qbittorrent
    steam-rom-manager
    superfile
    superTuxKart
    tetrio-desktop
    umu-launcher
    vesktop
    hyprpicker
  ];

  stylix = {
    enable = true;
#    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
#      base00 = "1e1e2e";
#      base01 = "181825";
#      base02 = "313244";
#      base03 = "45475a";
#      base04 = "585b70";
#      base05 = "cdd6f4";
#      base06 = "f5e0dc";
#      base07 = "b4befe";
#      base08 = "f38ba8";
#      base09 = "fab387";
#      base0A = "f9e2af";
#      base0B = "a6e3a1";
#      base0C = "94e2d5";
#      base0D = "89b4fa";
#      base0E = "cba6f7";
#      base0F = "f2cdcd";
#    };
    image = ./wallpaper.png;
    polarity = "dark";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
    opacity.terminal = 0.6;
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
#    iconTheme = {
#      enable = true;
#      package = pkgs.kdePackages.breeze;
#    };
    targets = {
#      hyprland.enable = false;
#      hyprpaper.enable = false;
      mangohud.enable = false;
      vscode.profileNames = [ "default" ];
      waybar.font = "sansSerif";
      firefox.profileNames = [ "l3awtpxv" ]; # tohle se urcite eventualne rozjebe
    };
  };
  programs = {
    git = import ./git.nix;
    obs-studio = {
      enable = true;
      plugins = [ pkgs.obs-studio-plugins.obs-vaapi ];
    };
    mangohud.enable = true;
    rofi.enable = true;
    fish = {
      enable = true;
      loginShellInit = "Hyprland";
      shellInit = "
        function rebuild; sudo nixos-rebuild switch --flake /home/samik/sysconfig; end
        function window; scream -i virbr0 & looking-glass-client; end
      ";
    };
#    mpv.enable = true;
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
        ];
        userSettings = { "editor.largeFileOptimizations" = "false"; };
      };
    };
    firefox.enable = true;
    kitty = {
      enable = true;
      settings = {
        confirm_os_window_close = 0;
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
      mimeType = [ "application/x-osu-beatmap-archive" "application/x-osu-skin-archive" "application/x-osu-beatmap" "application/x-osu-storyboard" "application/x-osu-replay" "x-scheme-handler/osu" ];
      categories = [ "Game" ];
    };
    blender = {
      name = "Blender";
      genericName = "Blender na dGPU";
      icon = "blender";
      exec = "nvidia-offload blender %f";
      mimeType = [ "application/x-blender" ];
      categories = [ "Graphics" "3DGraphics" ];
    };
  };
  nixpkgs.config.allowUnfree = true;
}
