{
  inputs,
  config,
  pkgs,
  ...
}: {
  home.stateVersion = "24.05";

  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    superfile
  ];

  programs.nvf = import ./nvf.nix;

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = ./wallpaper.png;
    imageScalingMode = "fill";
    polarity = "dark";
    autoEnable = true;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
    fonts = {
      monospace = {
        name = "Maple Mono NF";
        package = pkgs.maple-mono.NF;
      };
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = config.stylix.fonts.monospace;
      sizes = {
        desktop = 24;
        terminal = 24;
        applications = 24;
      };
    };
  };

  programs.fish.enable = true;

  nixpkgs.config.allowUnfree = true;
}
