# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

# let
#   # Define the path to the virtual environment and the Python script
#   venvPath = "/home/nixos/repos/python-automatic-routine/venv";
#   scriptPath = "/home/nixos/repos/python-automatic-routine/mainapp.py";
#   workingDir = "/home/nixos/repos/python-automatic-routine";
# in

# {
#   systemd.services.myDailyScript = {
#     description = "Python Script Runner";

#     serviceConfig = {
#       ExecStart = "${venvPath}/bin/python ${scriptPath}";
#       WorkingDirectory = workingDir;
#       User = "nixos";
#       Restart = "always"; # Ensure the service restarts after each run
#       RestartSec = "10s"; # Delay before restarting (if needed)
#     };

#     wantedBy = [ "multi-user.target" ];
#     after = [ "network.target" ];
#   };

#   systemd.timers.myDailyScript = {
#     description = "Timer for Python Script Runner every 10 seconds";
#     timerConfig = {
#       OnUnitActiveSec = "10s"; # Interval to trigger the service
#       Persistent = true;
#     };
#     wants = [ "myDailyScript.service" ];
#   };

{
  # WSL specific configuration
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
  ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  # System native packages
  environment.systemPackages = with pkgs; [
    home-manager
  ];

  # VS Code inside WSL
  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
