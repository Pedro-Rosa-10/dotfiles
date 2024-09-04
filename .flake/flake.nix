{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = {
        nixpkgs,
        home-manager,
        nixos-wsl,
        ...
    }:
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in
    {
        # NixOS on WSL System configuration
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
            # Import the WSL module
            (import "${nixos-wsl}/modules")
                {
                    wsl.enable = true;
                    wsl.defaultUser = "nixos";
                    # System packages https://search.nixos.org/packages
                    environment.systemPackages = with pkgs; [
                        direnv
                    ];
                    # Setup VSCode Remote
                    programs.nix-ld = {
                        enable = true;
                        package = pkgs.nix-ld-rs;
                    };
                    system.stateVersion = "24.05";
                }
            ];
        };
        # NixOS on WSL Home Manager configuration
        homeConfigurations."nixos@nixos" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
                {
                    home.username = "nixos";
                    home.homeDirectory = "/home/nixos";
                    home.stateVersion = "23.11";
                    # System packages https://search.nixos.org/packages
                    home.packages = with pkgs; [
                        wget
                        git
                        fastfetch
                    ];
                    programs.home-manager.enable = true;
                }
            ];
        };
        # Debian on WSL Home Manager configuration
        homeConfigurations."krauzer@POAN23090675" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
                {
                    home.username = "krauzer";
                    home.homeDirectory = "/home/krauzer";
                    home.stateVersion = "23.11";
                    # System packages https://search.nixos.org/packages
                    home.packages = with pkgs; [
						wget
						git
						direnv
						fastfetch
                    ];
                    programs.home-manager.enable = true;
                }
            ];
        };
    };
}
