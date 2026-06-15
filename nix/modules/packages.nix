{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    firefox
    chromium
    git
    vesktop
    vencord
    (discord.override {withVencord = true;})
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
    jq
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
    aseprite
    oxipng
    mangohud
    mangojuice
    man-pages
    protonup-qt
    vscode
    antigravity-fhs
    zed-editor
    jetbrains.idea
    blockbench
    lazygit
    pinta
    yad
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
    gemini-cli
    qwen-code
    
    ## go
    go
    gopls
    go-tools
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
    

    nix-ld = {
      enable = true; # Dinamyc link executables
    };
    dconf.enable = true; # eassyeffect dependency (mic)

  };
  services.ollama = {
    enable = true;
    loadModels = ["qwen2.5-coder:7b"];
    package = pkgs.ollama-vulkan;
  };

}

