{
  description = "Simple Wayland screenshot utility";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    wlshot.url = "github:binarylinuxx/wlshot";
  };

  outputs = { self, nixpkgs, flake-utils, wlshot, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages = {
          default = pkgs.stdenv.mkDerivation rec {
            pname = "wlshot";
            version = "1.0"; # You can adjust this as needed

            src = wlshot; # Use the directly fetched source from GitHub

            buildInputs = [
              pkgs.grim
              pkgs.slurp
              pkgs.wl-clipboard
            ];

            nativeBuildInputs = [ pkgs.makeWrapper ];

            installPhase = ''
              mkdir -p $out/bin
              cp ${src}/shot $out/bin/wlshot
              wrapProgram $out/bin/wlshot \
                --set PATH ${pkgs.grim}/bin:$PATH \
                --set PATH ${pkgs.slurp}/bin:$PATH \
                --set PATH ${pkgs.wl-clipboard}/bin:$PATH
            '';
          };
        };
        apps.default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/wlshot";
        };
      });
}
