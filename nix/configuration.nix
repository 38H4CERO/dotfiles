/* { config, pkgs, ... }:

   {
     imports = [ # Include the results of the hardware scan.
       ./hardware-configuration.nix
     ];

     # Bootloader.
     boot.loader.systemd-boot.enable = true;
     boot.loader.efi.canTouchEfiVariables = true;

     networking.hostName = "nixos"; # Define your hostname.
     # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

     # Configure network proxy if necessary
     # networking.proxy.default = "http://user:password@proxy:port/";
     # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

     # Enable networking
     networking.networkmanager.enable = true;

     # Set your time zone.
     time.timeZone = "Europe/Madrid";

     # Select internationalisation properties.
     i18n.defaultLocale = "en_US.UTF-8";

     i18n.extraLocaleSettings = {
       LC_ADDRESS = "es_ES.UTF-8";
       LC_IDENTIFICATION = "es_ES.UTF-8";
       LC_MEASUREMENT = "es_ES.UTF-8";
       LC_MONETARY = "es_ES.UTF-8";
       LC_NAME = "es_ES.UTF-8";
       LC_NUMERIC = "es_ES.UTF-8";
       LC_PAPER = "es_ES.UTF-8";
       LC_TELEPHONE = "es_ES.UTF-8";
       LC_TIME = "es_ES.UTF-8";
     };

     # Configure keymap in X11
     services.xserver.xkb = {
       layout = "es";
       variant = "nodeadkeys";
     };

     # Configure console keymap
     console.keyMap = "es";

     # Define a user account. Don't forget to set a password with ‘passwd’.
     users.users.redct = {
       isNormalUser = true;
       description = "redct";
       extraGroups = [ "networkmanager" "wheel" ];
       packages = with pkgs; [ ];
     };

     # Allow unfree packages
     nixpkgs.config.allowUnfree = true;

     # Enable flakes
     nix.settings.experimental-features = [ "nix-command" "flakes" ];

     # List packages installed in system profile
     environment.systemPackages = with pkgs; [
       firefox
       git
       vesktop
       curl
       gcc
       neovim
       ghostty
       spotify
       prismlauncher
       btop
       spicetify-cli
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
       slurp # dependencia de grim?
       cargo
       rustc
       uv # python
       quickshell

       wofi
       kdePackages.dolphin
       dolphind
       hyprpaper
       hyprcursor
     ];

     programs.npm.enable = true;

     services.blueman.enable = true;
     hardware.bluetooth = {
       enable = true;
       powerOnBoot = true;
       settings = {
         General = {
           Experimental = true; # Show battery charge of Bluetooth devices
         };
       };
     };
     programs.fish.enable = true;

     programs.hyprland = {
       enable = true;
       withUWSM = true;
       xwayland.enable = true;
     };

     services.displayManager = {
       defaultSession = "hyprland-uwsm";
       sddm = {
         enable = true;
         wayland.enable = true;
         # theme = "sddm-astronaut-theme";
       };
     };

     environment.sessionVariables = {
       # Hint electron apps to use wayland
       NIXOS_OZONE_WL = "1";
     };

     hardware = {
       graphics.enable = true;
       # Most wayland compositors need this
       nvidia.modesetting.enable = true;
     };

     fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

     # Some programs need SUID wrappers, can be configured further or are
     # started in user sessions.
     # programs.mtr.enable = true;
     # programs.gnupg.agent = {
     #   enable = true;
     #   enableSSHSupport = true;
     # };

     # List services that you want to enable:

     # Enable the OpenSSH daemon.
     # services.openssh.enable = true;

     # Open ports in the firewall.
     # networking.firewall.allowedTCPPorts = [ ... ];
     # networking.firewall.allowedUDPPorts = [ ... ];
     # Or disable the firewall altogether.
     # networking.firewall.enable = false;

     # This value determines the NixOS release from which the default
     # settings for stateful data, like file locations and database versions
     # on your system were taken. It‘s perfectly fine and recommended to leave
     # this value at the release version of the first install of this system.
     # Before changing this value read the documentation for this option
     # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
     system.stateVersion = "25.05"; # Did you read the comment?

   }
*/

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./modules/system.nix
    ./modules/packages.nix
    ./modules/hyprland.nix
    ./modules/home-manager.nix
  ];

  system.stateVersion = "25.05";
}
