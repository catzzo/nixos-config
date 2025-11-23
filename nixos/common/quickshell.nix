{ pkgs, conf, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    quickshell
    kdePackages.qtdeclarative # language server
  ];
}
