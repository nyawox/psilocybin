{
  description = "NixOS module to easily import the layout";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    kanata = {
      url = "github:jtroo/kanata";
      flake = false;
    };
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
      flake.nixosModules = {
        psilocybin = {
          imports = [
            ./kanata.nix
          ];
        };
      };
    };
}
