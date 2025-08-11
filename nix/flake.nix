{
  description = "Test";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {self, nixpkgs, ...}: 
  let 
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem { #name of hostname
        system = "x86_64-linux";
        modules = [ ./configuration.nix];
      };
    };
  };
}
