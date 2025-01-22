{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # UI Apps
      alacritty
      amberol
      audacity
      authenticator
      bitwarden-desktop
      brave
      element-desktop
      gapless
      gnome-tweaks
      lunar-client
      lutris
      mission-center
      obsidian
      prismlauncher
      ptyxis
      resources
      ryujinx
      shortwave
      thunderbird
      vesktop
      vivaldi
      vscode

      # CLI Programs
      fastfetch
      freshfetch
      mesa-demos
      neovim
      protonup

      # Fonts
      jetbrains-mono
      ubuntu-sans
      ubuntu-sans-mono

      # Utils
      adw-gtk3
      ddcutil
      pciutils
      vivaldi-ffmpeg-codecs
      vulkan-tools

  ];
}
