{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # dgop = {
    #   url = "github:AvengeMedia/dgop";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # dms-cli = {
    #   url = "github:AvengeMedia/danklinux";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # dankMaterialShell = {
    #   url = "github:AvengeMedia/DankMaterialShell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.dgop.follows = "dgop";
    #   inputs.dms-cli.follows = "dms-cli";
    # };
    # niri = {
    #   url = "github:sodiboo/niri-flake";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

  };

  outputs = { nixpkgs, home-manager, ... }@inputs: let
    stateVersion = "25.05";
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    laptop = "victus"; # make it simple in a multi system layout
    username = "catzzo";
  in {

      nixosConfigurations.${laptop} = nixpkgs.lib.nixosSystem{
        # system = system;
        specialArgs = let
          hostname = "${laptop}";
        in {
          inherit inputs stateVersion system hostname username;
        };
        modules = [./nixos/${laptop}/configuration.nix];
      };

      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = let
          hostname = "${laptop}";
        in {
          inherit inputs stateVersion system hostname username;
        };
        modules = [ ./nixos/${laptop}/home.nix];

      };

      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          go_1_25
          gopls
          golangci-lint
          golangci-lint-langserver
          gotools
          go-junit-report
          gocover-cobertura
          go-task
          goreleaser
          sqlc

          nushell
        ];

        shellHook = ''
          exec nu
        '';
      };
  };
}
