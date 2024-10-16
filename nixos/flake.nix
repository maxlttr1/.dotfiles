{
  description = "Coucou";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };  
  }; 
  
  outputs = inputs@{ self, nixpkgs, home-manager, nix-flatpak, ... }:
    let
      settings = {
        username = "maxlttr";
        hostname = "pc-maxlttr";
        system = "x86_64-linux";
        #isUEFI = false;
        grub-disk = "/dev/sda"; #Only for BIOS mode
        kernel = "linuxPackages";
      };
      isUEFI = builtins.pathExists "/sys/firmware/efi";
    in
    {
      nixosConfigurations."${settings.hostname}" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs isUEFI settings; };
        modules = [
          ./modules/apparmor.nix
          ./modules/auto-upgrade.nix
          ./modules/cups.nix
          ./modules/gamemode.nix
          ./modules/intel.nix
          ./modules/kde-plasma.nix
          ./modules/pipewire.nix
          ./modules/pkgs.nix
          ./modules/podman.nix
          ./modules/ssh.nix
          ./modules/tailscale.nix
          ./modules/tlp.nix
          ./modules/touchpad.nix
          ./modules/common
          nix-flatpak.nixosModules.nix-flatpak
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users."${settings.username}" = import ./modules/home.nix;
            home-manager.backupFileExtension= "backup";
          }
        ];
      };
  };
}
