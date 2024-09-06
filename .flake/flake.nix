{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, nixos-wsl, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    # nixos@nixos > cofiguration.nix
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        (import "${nixos-wsl}/modules") {
          nix.settings.experimental-features = [ "nix-command" "flakes" ];
          wsl.enable = true;
          wsl.defaultUser = "nixos";
          environment.systemPackages = with pkgs; [
            git
            wget
          ];
          # Setup VSCode Remote
          programs.nix-ld = {
            enable = true;
            package = pkgs.nix-ld-rs;
          };
          system.stateVersion = "24.05";
          # Nix store optimization
          systemd.timers.nix-optimise = {
            enable = true;
            timerConfig.OnCalendar = "weekly";
            timerConfig.Persistent = true;
          };
        }
      ];
    };
    # nixos@nixos > home.nix
    homeConfigurations."nixos@nixos" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        {
          home.username = "nixos";
          home.homeDirectory = "/home/nixos";
          home.stateVersion = "23.11";
          home.packages = with pkgs; [
            just
            direnv
            fastfetch
          ];
          programs.home-manager.enable = true;
        }
      ];
    };
    # krauzer@POAN23090675 > home.nix
    homeConfigurations."krauzer@POAN23090675" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        {
          home.username = "krauzer";
          home.homeDirectory = "/home/krauzer";
          home.stateVersion = "23.11";
          home.packages = with pkgs; [
            just
            direnv
            fastfetch
          ];
          programs.home-manager.enable = true;
        }
      ];
    };
  };
}
