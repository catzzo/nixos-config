{ pkgs, ...}:

{
  # Enable the KDE Plasma Desktop Environment.
  # services.displayManager.sddm.enable = true;
  # services.desktopManager.plasma6.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver = {
  enable = true;
  displayManager.gdm.enable = true;
  desktopManager.gnome.enable = true;
  };

  # Udev rule to force compositor to run with nvidia card
  services.udev.extraRules = ''
    ENV{DEVNAME}=="/dev/dri/card0", TAG+="mutter-device-preferred-primary"
  '';

  environment.systemPackages = with pkgs.gnomeExtensions; [
    # blur-my-shell
    pop-shell
    appindicator
  ];

  environment.gnome.excludePackages = (with pkgs; [
  epiphany # web browser
  # evince # document viewer
  geary # email reader
  gnome-music
  gnome-tour
]);

}