# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ config, lib, pkgs, ... }:

{
  # Daily Python Script Runner
  let
    # Define the path to the virtual environment and the Python script
    venvPath = "~/repos/python-automatic-routine/venv";
    scriptPath = "~/repos/python-automatic-routine/mainapp.py";
  in
  {
    systemd.services.myDailyScript = {
      description = "Python Script Runner every 10 seconds";

      # Run the service every 10 seconds
      timerConfig = {
        OnUnitActiveSec = "10s"; # Set the interval to 10 seconds
        Persistent = true;
      };

      # Ensure that the script runs within the virtual environment
      serviceConfig = {
        ExecStart = "${venvPath}/bin/python ${scriptPath}";
        WorkingDirectory = "${scriptPath}";
        User = "nixos"; # Set the user that should run the script
      };

      # Ensure the service is enabled
      wantedBy = [ "timers.target" ];
      after = [ "network.target" ]; # Ensure the network is up before running (if needed)
    };

    # Enable the timer for the service
    systemd.timers.myDailyScript = {
      description = "Timer for Python Script Runner every 10 seconds";
      wants = [ "myDailyScript.service" ];
    };
  }

  # WSL specific configuration
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
  ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  # System native pacages
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
