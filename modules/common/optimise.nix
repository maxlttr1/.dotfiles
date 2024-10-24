{
  nix.optimise.automatic = true; #periodic optimisation of the nix store
  nix.settings.auto-optimise-store = true; #the store can be optimised during every build. This may slow down builds

  nix.gc = { #Automated Garbage collection
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}