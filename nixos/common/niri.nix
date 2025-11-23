{ pkgs, ... }:

{
  imports = [
    ./quickshell.nix # to enable quickshell
  ];
  
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    mate.mate-polkit
    kdePackages.polkit-qt-1
    # polkit-gnome
    # cosmic-panel

  ];

  programs.labwc.enable = true;

  security.polkit.enable = true;
  security.soteria.enable = true;

  # Optional, hint Electron apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
