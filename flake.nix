{
  description = "wlshot - A simple screenshot tool for Wayland";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages.default = pkgs.stdenv.mkDerivation {
          name = "wlshot";
          version = "0.0.5";
          
          src = ./.;
          
          buildPhase = ''
            chmod +x ./wlshot
          '';
          
          installPhase = ''
            mkdir -p $out/bin
            cp ./wlshot $out/bin/shot
          '';
          
          buildInputs = with pkgs; [
            bash
          ];

	  runtimeInputs = with pkgs; [
	    bash
	    grim
	    slurp
	    wl-clipboard
	  ];
          
          meta = with pkgs.lib; {
            description = "wlshot";
            homepage = "https://github.com/binarylinuxx/wlshot/";
            license = licenses.mit;
            maintainers = [ "iwnuply <ikissiwnuply@gmail.com>" ];
            platforms = platforms.all;
          };
        };
        apps.default = flake-utils.lib.mkApp {
          drv = self.packages.${system}.default;
          name = "wlshot";
        };
      }
    );
}
