{ config, pkgs, ... }:

{
  boot.supportedFilesystems = [ "btrfs" ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_6_17;
  boot.kernelParams = [ "quiet" "splash" "acpi_osi=linux" "intel_idle.max_cstate=4" ];
  boot.plymouth.enable = true;

}
