{ pkgs, ... }:

{
   # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    curl
    fastfetch
    git
    tree
    unzip
    wget
  ];
};