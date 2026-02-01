{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # dgop = {
    #   url = "github:AvengeMedia/dgop";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # dankMaterialShell = {
    #   url = "github:AvengeMedia/DankMaterialShell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.dgop.follows = "dgop";
    # };
    # niri = {
    #   url = "github:sodiboo/niri-flake";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # quickshell = {
    #   url = "github:quickshell-mirror/quickshell?ref=master";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

  };

  outputs = { nixpkgs, nixpkgs-stable, home-manager, ... }@inputs: let
    stateVersion = "25.05";
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    laptop = "victus"; # make it simple in a multi system layout
    username = "catzzo";

    overlay-stable= final: prev: {
      # stable = nixpkgs-stable.legacyPackages.${prev.stdenv.hostPlatform.system};
      # use this variant if unfree packages are needed:
      stable = import nixpkgs-stable {
        system = prev.stdenv.hostPlatform.system;
        config.allowUnfree = true;
      };

    };
  in {

      nixosConfigurations.${laptop} = nixpkgs.lib.nixosSystem{
        # system = system;
        specialArgs = let
          hostname = "${laptop}";
        in {
          inherit inputs stateVersion system hostname username;
        };
        modules = [
          # Overlays-module makes "pkgs.stable" available in configuration.nix
          ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-stable ]; })
          ./nixos/${laptop}/configuration.nix
        ];
      };

      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = let
          hostname = "${laptop}";
        in {
          inherit inputs stateVersion system hostname username;
        };
        modules = [
          ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-stable ]; })
          ./nixos/${laptop}/home.nix
        ];

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
