
{
  imports = [
    # Specific:
    
    # From common:
    ./../../../common/hm/alacritty.nix
    ./../../../common/hm/git.nix
    ./../../../common/hm/helix.nix
    ./../../../common/hm/wezterm.nix
    ./../../../common/hm/zoxide.nix
    # ./../../../common/hm/zellij.nix
    
    # From nixos common:
    ./../../common/home-manager/dankMaterialShell.nix
  ];
}
