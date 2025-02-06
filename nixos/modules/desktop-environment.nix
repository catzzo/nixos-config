{ pkgs, lib, ...}:

{

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Force kwin to use dGPU. I dont know why this doesnt work here but whork at ~/.config/plasma-workspace/variables.sh
  # environment.variables = {
  #   KWIN_DRM_DEVICES = "/dev/dri/by-path/pci-0000\:01\:00.0-card:/dev/dri/by-path/pci-0000\:00\:02.0-card";
  # };

  # Enable the GNOME Desktop Environment.
#   services.xserver = {
#   enable = true;
#   # displayManager.gdm.enable = true;
#   desktopManager.gnome.enable = true;
#   };

#   # Force mutter to use dGPU
#   services.udev.extraRules = ''
#     ENV{DEVNAME}=="/dev/dri/card0", TAG+="mutter-device-preferred-primary"
#   '';

#   environment.systemPackages = with pkgs.gnomeExtensions; [
#     appindicator
#     fullscreen-avoider
#     blur-my-shell
#     caffeine
#     fullscreen-avoider
#     pop-shell
#     runcat
#   ];

#   environment.gnome.excludePackages = (with pkgs; [
#   epiphany # web browser
#   # evince # document viewer
#   geary # email reader
#   gnome-music
#   gnome-tour
# ]);

# programs.ssh.askPassword = lib.mkForce "${pkgs.plasma5Packages.ksshaskpass}/bin/ksshaskpass";

}
