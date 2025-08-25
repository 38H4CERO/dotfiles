{ pkgs, ... }:

{
  # Habilita el compositor Hyprland a nivel de sistema
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  # Habilita el gestor de inicio de sesión
  services.displayManager = {
    enable = true;
    defaultSession = "hyprland-uwsm";

    sddm = {
      enable = true;
      wayland.enable = true;
      package = pkgs.kdePackages.sddm;
      extraPackages = with pkgs; [
        kdePackages.qtsvg
        kdePackages.qtmultimedia
        kdePackages.qtvirtualkeyboard
      ];
      theme = "sddm-astronaut-theme";
    };
  };
  environment.sessionVariables = {
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    graphics.enable = true;
    # Most wayland compositors need this
    nvidia.modesetting.enable = true;
  };

  # Teclado para Xwayland
  services.xserver.xkb = {
    layout = "es";
    variant = "nodeadkeys";
  };
}
