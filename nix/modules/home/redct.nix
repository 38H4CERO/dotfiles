{ pkgs, inputs, ... }:

{
  home.username = "redct";
  home.homeDirectory = "/home/redct";

  # Importa las opciones del flake de spicetify
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  # Configuración del tema del cursor
  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
    x11.enable = true;
  };

  # Paquetes de usuario
  home.packages = with pkgs; [
    # Esenciales
    stow
    firefox
    waybar
    pavucontrol

    # CLI / Dev
    neovim
    tmux
    fzf
    bat

    # Media
    vesktop
    mpv
    playerctl
  ];

  # Configuración declarativa de Spicetify
  programs.spicetify = {
    enable = true;
    spotify.package = pkgs.spotify;
    theme = "Catppuccin";
    colorScheme = "Mocha";
  };

  # Habilitar programas de usuario
  programs.fish.enable = true;

  # Nota: Los archivos de configuración (dotfiles) para hypr, waybar, fish, etc.,
  # se gestionan manualmente con `stow` y no aquí.

  home.stateVersion = "25.05";
}
