{ config, pkgs, ... }:

{
  # Enable Flakes experimental feature
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  # User information and paths
  home.username = "krauzer";
  home.homeDirectory = "/home/krauzer";

  # Home Manager release version compatibility
  home.stateVersion = "23.11";

  # https://search.nixos.org/packages
  home.packages = with pkgs; [
    wget
    # hello
  ];

  # https://nixos.wiki/wiki/Home_Manager#Managing_your_dotfiles
  home.file = { };

  # https://mynixos.com/home-manager/option/home.sessionVariables
  home.sessionVariables = { };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}
