{

  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = ["catzzo"];

  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

}