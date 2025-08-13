{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    curl
    gcc
    git # Útil tenerlo disponible globalmente
    wl-clipboard
    grim
    slurp
  ];
}
