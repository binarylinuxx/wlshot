{
  description = "Simple Wayland screenshot utility";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        scriptContent = builtins.readFile ./shot;
      in {
        packages = {
          default = pkgs.writeShellApplication {
            name = "wlshot";
            text = scriptContent;
            runtimeInputs = [
              pkgs.grim
              pkgs.slurp
              pkgs.wl-clipboard
            ];
          };
        };
        apps.default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/wlshot";
        };
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.grim
            pkgs.slurp
            pkgs.wl-clipboard
            pkgs.shellcheck
          ];
        };
      });
}
