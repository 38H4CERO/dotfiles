{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    firefox
    chromium
    git
    vesktop
    discord
    curl
    gcc

    #vim
    helix # probando
    neovim
    wget
    go
    luarocks
    bash
    python313Packages.pip
    tree-sitter
    ruff
    pyright
    
    #hypr
    hyprpwcenter
    hyprlauncher
    hyprpaper
    hyprcursor
    #hyprshutdown
    
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
    fastfetch
    dutree
    zip
    tldr
    mpv
    r2modman
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
    ffmpeg
    feh # image preview
    gimp
    imagemagick
    ripgrep
    yt-dlp
    rsync
    zulu # java21
    dunst
    pamixer
    brightnessctl
    nodejs
    sddm-astronaut
    networkmanager
    eza
    heroic
    mangohud
    mangojuice
    man-pages
    protonup-qt
    vscode
    antigravity-fhs
    blockbench
    lazygit
    pinta
    ncdu # mb en una carpeta
    freefilesync
    nvitop # nvidia btop
    kdePackages.kate
    mindustry-wayland
    ## TFG
    filezilla
    bruno
    sqlite
    whois
    dig
    protonvpn-gui
    opencode
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

