# ~/dotfiles/nix/modules/home-manager.nix

{ inputs, ... }:

{
  home-manager.extraSpecialArgs = { inherit inputs; };

  home-manager.users.redct = { imports = [ ./home/redct.nix ]; };
}

