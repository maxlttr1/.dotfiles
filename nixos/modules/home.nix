{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "maxlttr";
  home.homeDirectory = "/home/maxlttr";

  # Packages that should be installed to the user profile.
  home.packages = [
  ];

  programs.git = {
    enable = true;
    userEmail = "maxime.lettier@protonmail.com";
    userName = "maxlttr1";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}
