{ pkgs, config, inputs, ... }:

{
  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    inputs.niri.homeModules.niri
  ];
  programs.dankMaterialShell.enable = true;

  home.packages = with pkgs; [
    material-symbols
    inter
    fira-code
  ];
  
}
