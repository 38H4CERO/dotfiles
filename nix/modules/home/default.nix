{
  imports = [
    ./spicetify.nix
    ./cursor.nix
  ];

  services.easyeffects.enable = true; # mic

  home.stateVersion = "25.05";
}
