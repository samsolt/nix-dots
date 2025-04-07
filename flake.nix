{
  description = "samikuv nixos sysconfig flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, stylix, hyprland, ... }@inputs: {
    nixosConfigurations.snow = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ # no clue co delam :(
        ./configuration.nix
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager { 
          home-manager = {
            useUserPackages = true;
            backupFileExtension = "backup";
            extraSpecialArgs = { inherit inputs; };
            users.samik = import ./home.nix;
          };
        }
      ];
    };
  };
}
