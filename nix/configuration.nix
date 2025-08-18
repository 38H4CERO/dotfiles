{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./modules/system.nix
    ./modules/packages.nix
    ./modules/hyprland.nix
    ./modules/home-manager.nix
  ];

  system.stateVersion = "25.05";
}
