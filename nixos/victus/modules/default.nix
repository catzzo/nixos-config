{
  imports = [
    ./nvidia.nix
    ./boot.nix

    # common
    ./../../common/localsend.nix
    ./../../common/virt-manager.nix
    ./../../common/niri.nix
    #
    # ./../../common/obs.nix

    # Desktop
    # ./../../common/gnome.nix # Currently declared on the config.nix IDKW
    # ./../../common/niri.nix
  ];
}
