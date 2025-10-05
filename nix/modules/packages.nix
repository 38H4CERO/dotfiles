{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    firefox
    chromium
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
    nautilus
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
    mangohud
    mangojuice
    protonup-qt
    vscode
    ## TFG
    sqlite
    whois
    dig
    protonvpn-gui
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

    dconf.enable = true; # eassyeffect dependency (mic)
  };

  virtualisation.waydroid.enable = true;
}

