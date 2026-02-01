{ pkgs, inputs, ... }:

{
  imports = [
    # ./quickshell.nix # to enable quickshell
  ];
  
  # nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  programs.niri = {
    enable = true;
    # package = pkgs.niri-unstable;
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    # mate.mate-polkit
    # kdePackages.polkit-qt-1
    # polkit-gnome
    # cosmic-panel

  ];

  programs.labwc.enable = true;

  security.polkit.enable = true;
  security.soteria.enable = true;
  # systemd.user.services.niri-flake-polkit.enable = false;

  # Optional, hint Electron apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
