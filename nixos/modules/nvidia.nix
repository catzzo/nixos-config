{ config, ... } :

{
  # Set NVIDIA drivers
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  }; 
  
  specialisation = {
    docked.configuration = {
      system.nixos.tags = [ "docked" ];
      services.xserver.videoDrivers = [ "nvidia" ];

      hardware.nvidia = {

        # Due to bluilding problems with kernel 6.13 
        package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
          version = "570.86.16"; # use new 570 drivers
          sha256_64bit = "sha256-RWPqS7ZUJH9JEAWlfHLGdqrNlavhaR1xMyzs8lJhy9U=";
          openSha256 = "sha256-DuVNA63+pJ8IB7Tw2gM4HbwlOh1bcDg2AN2mbEU9VPE=";
          settingsSha256 = "sha256-9rtqh64TyhDF5fFAYiWl3oDHzKJqyOW3abpcf2iNRT8=";
          usePersistenced = false;
        };

        open = false; # True for the open kernel modules
        modesetting.enable = true;
        nvidiaSettings = true;
        # forceFullCompositionPipeline = true;

        prime = {
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };
        #  sync.enable = true;

          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };

      # Force mutter to use dGPU
      services.udev.extraRules = ''
        ENV{DEVNAME}=="/dev/dri/card0", TAG+="mutter-device-preferred-primary"
      '';

      # Force kwin to use dGPU. I dont know why this doesnt work here but whork at ~/.config/plasma-workspace/variables.sh
      # environment.variables = {
      #   KWIN_DRM_DEVICES = "/dev/dri/by-path/pci-0000\:01\:00.0-card:/dev/dri/by-path/pci-0000\:00\:02.0-card";
      # };

    };
  };
}
  
