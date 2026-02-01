{ config, pkgs, stateVersion, system, hostname, username, ... }:

{
  imports = [
    # ./home-packages.nix
    ./home-modules
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.stateVersion = stateVersion; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    anki
    audacity
    bitwarden-desktop
    brave
    element-desktop
    heroic-unwrapped
    kdePackages.elisa
    foliate
    freshfetch
    # gnome-frog
    google-chrome
    lunar-client
    mission-center
    normcap
    obsidian
    onlyoffice-desktopeditors
    papers
    pinta
    prismlauncher
    # upscaler
    vesktop
    ryubing
    motrix
    kdePackages.okular
    ptyxis
    qutebrowser
    logseq
    recordbox
    cavalier
    lutris
    pavucontrol
    blanket
    flowtime
    gradia
    fractal
    stable.zed-editor
    qbittorrent

    # CLI
    bat
    mangohud
    ocrmypdf
    pdfsandwich

    # TUIs
    nbsdgames
    zellij


    # a
    scantailor-advanced
    naps2

    # Fonts
    jetbrains-mono
    ubuntu-sans
    ubuntu-sans-mono

    # Utilitis
    discord-rpc
    mesa-demos

  ];

  fonts.fontconfig.enable =true;
  
  services.arrpc.enable = true;
  
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/catzzo/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
