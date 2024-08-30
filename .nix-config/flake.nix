{
  description = "Krauzer Home Manager configuration";
  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      # Home Manager
      homeConfigurations.krauzer = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
        ];
      };
      # Direnv
      devShells.x86_64-linux.default = pkgs.mkShell {
        packages = with pkgs ;[
          # https://search.nixos.org/packages
          direnv
          # make
          # gitea
        ];
        # Environment variables
        shellHook = ''
          export HOME=/home/krauzer
        '';
      };
    };
}
