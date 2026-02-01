{
  imports = [
    ./nvidia.nix
    ./boot.nix

    # common
    ./../../common/localsend.nix
    ./../../common/virt-manager.nix
    ./../../common/obs.nix
    ./../../common/java.nix

    # Desktop
    # ./../../common/gnome.nix 
    # ./../../common/niri.nix
    ./../../common/plasma.nix
    # ./../../common/cosmic.nix
    ./../../common/river.nix
  ];
}
