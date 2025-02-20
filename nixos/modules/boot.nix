{ pkgs, lib, ... } :

{
  # boot.loader.systemd-boot.enable = false;
  #boot.loader = {
  #  timeout = 10;
  #  efi.canTouchEfiVariables = true;
  #  grub = {
  #    enable = true;
  #    device = "nodev";
  #    efiSupport = true;
  #    useOSProber = true;
  #    configurationLimit = 40;
  #  };
  #};

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  #boot.initrd.kernelModules = [ "nvidia" "i915" "nvidia_modeset" "nvidia_drm" ];
  #boot.kernelParams = [ "intel_idle.max_cstate=4" "nvidia-drm.modeset=1" ];
  boot.kernelParams = [ "intel_idle.max_cstate=4" ];

}
