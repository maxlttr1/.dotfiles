{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    nix-flatpak.url = "github:gmodena/nix-flatpak";
  }; 
  
  outputs = { self, nixpkgs, home-manager, stylix, nix-flatpak, ... }@inputs:
      nixosConfigurations = {
        pc-maxlttr = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs; };
          modules = [ 
            ./configs/configuration.nix
            ./modules
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.maxlttr = import ./modules/home.nix;
            } 
            stylix.nixosModules.stylix
            nix-flatpak.nixosModules.nix-flatpak
          ];
        };

        #"server" = nixpkgs.lib.nixosSystem {
        #  specialArgs = {inherit inputs; };
        #  modules = [ 
        #    ./configuration-server.nix
        #  ];
        #};
      };
    };
}
