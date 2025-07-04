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

  programs.fish.enable = true;

  nixpkgs.config.allowUnfree = true;
}
