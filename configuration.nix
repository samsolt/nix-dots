{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  environment.systemPackages = with pkgs; [
    appimage-run
    brightnessctl
    btop
    busybox
    cmake
    fastfetch
    ffmpeg_6-full
    gcc
    gdb
    git
    gnumake
    hyprpolkitagent
    unixtools.xxd
    hyprshot
    mesa
    mesa-demos
    ncdu
    nvtopPackages.full
    pciutils
    rar
    qemu-utils
    scream
    virglrenderer
    virt-viewer
    vulkan-tools
    waydroid-helper
    wev
    winetricks
    wineWowPackages.full
    wl-clipboard

    alsa-utils
    pulseaudioFull
    pavucontrol
    alsa-firmware
    sof-firmware
    alsa-ucm-conf
  ];

  programs.nvf = import ./nvf.nix;

  virtualisation.waydroid.enable = true;

  programs.fish.enable = true;

  programs.steam.enable = true;

  stylix = {
    enable = true;
    image = ./wallpaper.png;
    polarity = "dark";
  };

  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
  services.logind.lidSwitch = "ignore";
  services.jellyfin = {
    enable = true;
    group = "mediaserver";
  };
  services.sonarr = {
    enable = true;
    group = "mediaserver";
  };
  services.sunshine = {
    enable = true;
    autoStart = false;
    capSysAdmin = true; # only needed for Wayland -- omit this when using with Xorg
    openFirewall = true;
  };
  services.getty.autologinUser = "samik";
  services.openssh.enable = true;
  services.tailscale.enable = true;
  services.httpd = {
    enable = true;
    virtualHosts = {
      "kocka.moe" = {
        documentRoot = "/srv/kocka.moe";
        listen = [
          {
            port = 80;
          }
        ];
      };
      "soru.moe" = {
        documentRoot = "/srv/soru.moe";
        listen = [
          {
            port = 81;
          }
        ];
      };
    };
  };
  services.cloudflared = {
    enable = true;
    tunnels."d0a740ee-df6d-436a-acb4-384752cbe10e" = {
      credentialsFile = ./d0a740ee-df6d-436a-acb4-384752cbe10e.json;
      default = "http_status:404";
    };
  };
  services.asusd = {
    enable = true;
    enableUserService = true;
  };
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    config.common.default = "*";
  };

  services.playerctld.enable = true;
  services.printing = {
    enable = true;
    drivers = [pkgs.brlaser pkgs.brgenml1lpr pkgs.brgenml1cupswrapper];
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  services.udev = {
    enable = true;
    packages = [pkgs.wooting-udev-rules];
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;
    }
  ];

  hardware.opentabletdriver.enable = true;
  hardware.sane.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  hardware.graphics = {
    enable = true;
    extraPackages = [pkgs.intel-media-driver];
  };
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false; # ditto
    powerManagement.finegrained = false; # vypnuty protoze "Unable to change device power state from D3cold to D0" a pak se to cely zesere; idk jestli to vypnuti fixne
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
  hardware.nvidia.prime = {
    offload.enable = true;
    offload.enableOffloadCmd = true;
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  networking = {
    firewall.allowedUDPPorts = [4010];
    networkmanager = {
      enable = true;
      #      wifi.powersave = false;
    };
  };

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  users = {
    users.samik = {
      isNormalUser = true;
      description = "samik";
      extraGroups = ["networkmanager" "wheel" "kvm" "libvirtd" "mediaserver" "lp" "scanner"];
      homeMode = "701";
      shell = pkgs.fish;
    };
    groups.mediaserver.members = ["jellyfin" "sonarr"];
  };

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      font-awesome
    ];
  };

  # qemu uefi firmware support z wiki.nixos.org
  systemd.tmpfiles.rules = ["L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware"];

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        windows."11".efiDeviceHandle = "HD1b"; # daulboot
      };
      timeout = 1;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };
    #   extraModprobeConfig = ''
    #     options snd-hda-intel model=asus-zenbook
    #   '';
    modprobeConfig.useUbuntuModuleBlacklist = false;
    kernelParams = ["intel_iommu=on" "iommu=pt" "vfio-pci.ids=10de:2191"];
    supportedFilesystems = ["ntfs"];
  };

  networking.hostName = "snow"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "Europe/Prague";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "cs_CZ.UTF-8/UTF-8"
    "ja_JP.UTF-8/UTF-8"
  ];
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "cs_CZ.UTF-8";
    LC_IDENTIFICATION = "cs_CZ.UTF-8";
    LC_MEASUREMENT = "cs_CZ.UTF-8";
    LC_MONETARY = "cs_CZ.UTF-8";
    LC_NAME = "cs_CZ.UTF-8";
    LC_NUMERIC = "cs_CZ.UTF-8";
    LC_PAPER = "cs_CZ.UTF-8";
    LC_TELEPHONE = "cs_CZ.UTF-8";
    LC_TIME = "cs_CZ.UTF-8";
  };

  #  i18n.inputMethod = {
  #    enable = true;
  #    type = "fcitx5";
  #    fcitx5 = {
  #      waylandFrontend = true;
  #      addons = [
  #        pkgs.fcitx5-mozc
  #        pkgs.fcitx5-gtk
  #      ];
  #    };
  #  };

  security = {
    polkit.enable = true;
    pam.sshAgentAuth = {
      enable = true;
      authorizedKeysFiles = ["/home/samik/.ssh/id_rsa.pub"];
    };
    protectKernelImage = false;
  };

  nixpkgs.config = {
    allowUnfree = true;

    #tohle je pro sonarr
    permittedInsecurePackages = [
      "dotnet-sdk-6.0.428"
      "aspnetcore-runtime-6.0.36"
    ];
  };

  system.stateVersion = "24.11"; # nikdy nemenit prej
}
