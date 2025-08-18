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
    wofi
    kdePackages.dolphin
    hyprpaper
    hyprcursor
    tree
    feh # image preview
    gimp
    imagemagick
    ripgrep
  ];
}
