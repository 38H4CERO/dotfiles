{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    firefox
    chromium
    git
    vesktop
    curl
    gcc

    #vim
    neovim
    wget
    go
    luarocks
    bash
    python313Packages.pip
    tree-sitter
    ruff
    pyright

    ghostty
    prismlauncher
    btop
    waybar
    pavucontrol
    playerctl
    tmux
    scrcpy
    python3
    lua
    fzf
    fd
    bat
    unzip
    zip
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
    antigravity-fhs
    lazygit
    nvitop # nvidia btop
    kdePackages.kate
    ## TFG
    filezilla
    bruno
    sqlite
    whois
    dig
    protonvpn-gui
  ];
  programs = {
    obs-studio.enable = true;
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
}

