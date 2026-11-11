{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (prismlauncher.override {
      additionalLibs = [
       libxi
       libxrender
       libxtst
       libxkbcommon
       libdecor
      ];
    })
    r2modman
    retroarch-full
    heroic
    mangohud
    mangojuice
    protonup-qt
    moonlight-qt
    melonds
  ];

  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # For Steam Remote Play
      dedicatedServer.openFirewall = true; # For Source Dedicated Server hosting
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
  };
}
