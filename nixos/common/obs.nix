{ config, pkgs, ... }:

{

  # Using flatpak rn
  # programs.obs-studio.enable = true;
  # programs.obs-studio.enableVirtualCamera = true;

  # programs.obs-studio.plugins = (with pkgs.obs-studio-plugins; [
  #   droidcam-obs
  #   # obs-composite-blur
  #   obs-pipewire-audio-capture
  #   # obs-vertical-canvas
  #   obs-vkcapture
  #   waveform
  # ]);

  # Virtual cam settings: see https://wiki.nixos.org/wiki/OBS_Studio#Using_the_Virtual_Camera
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=3 video_nr=8,9 card_label="Loopback-1,Loopback-2,Loopback-3" exclusive_caps=1,1,1
  '';
  security.polkit.enable = true;

  # programs.droidcam.enable = true;
}
