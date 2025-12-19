{
  programs.alacritty = {
    enable = true;
    # theme = "vesper";
    theme = "oxocarbon";
    settings = {

      terminal.shell = "/run/current-system/sw/bin/fish";

      window = {
        dimensions = {
          lines = 30;
          columns = 140;
        };

        padding = {
          x = 8;
          y = 8;
        };

        dynamic_padding = true;
        # opacity = 0.9;
        decorations = "none";
      };

      font = {
        normal.family = "JetBrains Mono";
      	size = 11.0;
      };
    };
  };
}
