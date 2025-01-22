{
  # Set NVIDIA drivers
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
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
}
  