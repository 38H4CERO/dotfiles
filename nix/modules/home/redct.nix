{ pkgs, inputs, ... }:
let spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in {
  home.username = "redct";
  home.homeDirectory = "/home/redct";
  nixpkgs.config.allowUnfree = true;
  # Lo único que activamos es el propio Home Manager.
  programs.home-manager.enable = true;

  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
    x11.enable = true;
  };

  services.easyeffects.enable = true; # mic

  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  # 2. Activamos y configuramos spicetify
  programs = {
    spicetify = {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblockify
        hidePodcasts
        volumePercentage
      ];

      enabledCustomApps = with spicePkgs.apps; [ marketplace ];
      theme = spicePkgs.themes.burntSienna;
      enabledSnippets = [
        # RemoveGradient
        ".main-entityHeader-backgroundColor { display: none !important; } .main-actionBarBackground-background { display: none !important; } .main-home-homeHeader { display: none !important; }"
      ];
      # Puedes añadir extensiones aquí si quieres en el futuro
      #extensions = with pkgs.spicetify-extensions; [ marketplace adblock ];
    };

  };

  home.packages = with pkgs;
    [
      # Fastanime
      #inputs.viu.packages.${pkgs.system}.default

    ];
  # Bloque 2: Configuración de Spotify (de Home Manager).
  # Spicetify encontrará y usará esta configuración.
  home.stateVersion = "25.05"; # O la versión que te corresponda
}
