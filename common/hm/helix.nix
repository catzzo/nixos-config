{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    settings = {
      theme = "carbonfox";
      editor = {

        line-number = "relative";
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
    };
  };  

  home.packages = with pkgs; [
    marksman
  ];
}
