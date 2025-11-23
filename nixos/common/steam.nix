{ config, pkgs, ... }:
{
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  # programs.gamescope.capSysNice = true;
  programs.gamemode.enable = true;

  environment.systemPackages = [ pkgs.protonplus ];

}
