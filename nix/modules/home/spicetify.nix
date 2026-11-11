{ inputs, pkgs, ... }:
let spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  programs.spicetify = {
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
  };
}
