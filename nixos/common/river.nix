{ pkgs, ... }:

{
  programs.river-classic.enable = true;

  environment.sistemPackages = with pkgs; [
    bemenu
    waybar
    wlr-randr
  ];
}
