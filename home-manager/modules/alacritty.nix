{
  programs.alacritty = {
    enable = true;
    settings = {

      terminal.shell = "/home/catzzo/.nix-profile/bin/fish";

      window = {
        dimensions = {
          lines = 30;
          columns = 120;
        };

        padding = {
          x = 8;
          y = 8;
        };

        dynamic_padding = true;

        opacity = 0.9;
        
        decorations = "none";
      };

      font = {
        normal.family = "JetBrains Mono";

	size = 13.0;
      };
    };
  };
}
