{ pkgs, lib, ...}:

{

  # Enable the KDE Plasma Desktop Environment.
  # services.displayManager.sddm.enable = true;
  # services.displayManager.sddm.wayland.enable = true;
  # services.desktopManager.plasma6.enable = true;

  

  # Enable the GNOME Desktop Environment.
  services.xserver = {
  enable = true;
  displayManager.gdm.enable = true;
  desktopManager.gnome.enable = true;
  };

  environment.systemPackages = with pkgs.gnomeExtensions; [
    appindicator
    fullscreen-avoider
    blur-my-shell
    caffeine
    fullscreen-avoider
    pop-shell
    runcat
  ];

  environment.gnome.excludePackages = (with pkgs; [
  epiphany # web browser
  evince # document viewer
  geary # email reader
  gnome-music
  gnome-tour
]);

# programs.ssh.askPassword = lib.mkForce "${pkgs.plasma5Packages.ksshaskpass}/bin/ksshaskpass";

}
