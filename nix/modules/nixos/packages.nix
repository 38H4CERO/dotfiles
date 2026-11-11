{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    firefox
    chromium
    git
    vesktop
    (discord.override {withVencord = false;})
    curl
    gcc

    #vim
    helix # probando
    neovim
    wget
    luarocks
    tree-sitter
    ruff
    pyright

    #hypr
    hyprpwcenter
    hyprlauncher
    hyprpaper
    hyprcursor
    hyprpolkitagent
    #hyprshutdown

    ghostty
    btop
    waybar
    pavucontrol
    playerctl
    tmux
    scrcpy
    python3
    stow
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
    nmgui
    ani-cli
    wl-clipboard
    grim
    slurp
    cargo
    rustc
    uv # python
    quickshell
    claude-code
    wofi
    love # love2d lua 2d engine
    difftastic
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
    eza
    aseprite
    oxipng
    man-pages
    vscode
    zed-editor
    jetbrains.idea
    blockbench
    lazygit
    pinta
    drawy
    yad
    kdePackages.okular
    nethogs # internet monitor
    iftop # internet monitor
    ncdu # mb en una carpeta
    freefilesync
    nvitop # nvidia btop
    kdePackages.kate
    oci-cli
    kitty
    starship
    nnn

    ## TFG
    filezilla
    bruno
    sqlite
    whois
    dig
    proton-vpn

    opencode

    ## go
    go
    gopls
    go-tools
  ];
  programs = {
    obs-studio.enable = true;
    nix-ld = {
      enable = true; # Dinamyc link executables
    };
    dconf.enable = true; # eassyeffect dependency (mic)
  };
  virtualisation.waydroid.enable = true;
  networking.nftables.enable = true; # waydroid networking needs nftables
}

