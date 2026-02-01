{ pkgs, config, inputs, system, ... }:

{
  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    # inputs.niri.homeModules.niri
  ];

  programs.dankMaterialShell = {
    enable = true;
    quickshell.package = inputs.quickshell.packages.${system}.default;
  };

  home.packages = with pkgs; [
    material-symbols
    inter
    fira-code
  ];
  
}
