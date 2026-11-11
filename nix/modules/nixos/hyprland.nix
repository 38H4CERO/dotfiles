{ pkgs, ... }:

{
  # Habilita el compositor Hyprland a nivel de sistema
  programs = {
    hyprland = {
        enable = true;
        withUWSM = true;
        xwayland.enable = true;
    };

    hyprlock.enable = true;
  };
  services.hypridle.enable = true;

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
  environment.systemPackages = [ pkgs.sddm-astronaut ];

  environment.sessionVariables = {
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };
  
  # Open with in dolphin
  xdg.portal = {
    enable = true;
    config = {
      hyprland = {
        default = [
          "hyprland"
          "kde"
        ];
      };
    };
    configPackages = with pkgs; [
      xdg-desktop-portal-hyprland
      kdePackages.xdg-desktop-portal-kde
    ];
  };
}
