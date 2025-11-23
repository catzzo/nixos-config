{ pkgs, lib, ... }:

{
  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    adw-gtk3
    gnome-tweaks

    gnomeExtensions.appindicator
    gnomeExtensions.fullscreen-avoider
    gnomeExtensions.blur-my-shell
    gnomeExtensions.caffeine
    gnomeExtensions.fullscreen-avoider
    gnomeExtensions.pop-shell
    gnomeExtensions.runcat
  ];

  # Set to fix some GNOME 49 related graphical issues
  environment.variables = {
    GSK_RENDERER = "gl";
  };

   qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

}
