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
      foliate
      gapless
      gnome-tweaks
      lutris
      mission-center
      obsidian
      papers
      prismlauncher
      ptyxis
      refine
      resources
      ryujinx
      shortwave
      thunderbird
      upscaler
      varia
      vesktop
      vivaldi
      vscode

      # CLI Programs
      bat
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
      mangohud
      pciutils
      vivaldi-ffmpeg-codecs
      vulkan-tools

  ];
}
