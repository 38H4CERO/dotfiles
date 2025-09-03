{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    firefox
    git
    vesktop
    curl
    gcc
    neovim
    ghostty
    prismlauncher
    btop
    waybar
    pavucontrol
    playerctl
    tmux
    python3
    lua
    fzf
    fd
    bat
    unzip
    tldr
    mpv
    ani-cli
    wl-clipboard
    grim
    slurp
    cargo
    rustc
    uv # python
    quickshell
    quickemu # VM
    wofi
    qbittorrent
    kdePackages.dolphin
    hyprpaper
    ffmpeg
    hyprcursor
    feh # image preview
    gimp
    imagemagick
    ripgrep
    zulu # java21
    dunst
    pamixer
    brightnessctl
    nodejs
    sddm-astronaut
    networkmanager
    eza
  ];
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true; # For Steam Remote Play
      dedicatedServer.openFirewall = true; # For Source Dedicated Server hosting
    };
    gamemode.enable = true;
  };
  virtualisation.waydroid.enable = true;
}
