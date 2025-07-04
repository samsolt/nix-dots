{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  environment.packages = with pkgs; [
    neovim
    git
    openssh
    #procps
    #killall
    #diffutils
    findutils
    #utillinux
    #tzdata
    #hostname
    man
    gnugrep
    #gnupg
    #gnused
    #gnutar
    #bzip2
    #gzip
    #xz
    #zip
    #unzip
    fastfetch

    gcc
    gnumake
    cmake
  ];

  terminal.font = "${pkgs.maple-mono.NF}/share/fonts/truetype/MapleMono-NF-Regular.ttf";

  user.shell = "${pkgs.fish}/bin/fish";

  home-manager = {
    backupFileExtension = "hm-bak";
    useUserPackages = true;
    config = import ./droidhome.nix;
    extraSpecialArgs = {inherit inputs;};
  };

  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "24.05";

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  time.timeZone = "Europe/Prague";
}
