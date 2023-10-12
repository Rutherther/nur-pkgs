# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> {} }: {
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  firefoxpwa = pkgs.callPackage ./pkgs/firefoxpwa { };
  firefoxpwa-unwrapped = pkgs.callPackage ./pkgs/firefoxpwa/unwrapped.nix { };

  rutherther-sequence-detector = pkgs.callPackage (pkgs.fetchFromGitHub {
    owner = "Rutherther";
    repo = "sequence-detector";
    rev = "c447c0d83877907c3ade8a2e9b4f659d4ef92904";
    hash = "sha256-Bo+IE3aBEHFsnKPrcSVe9x1QNmB8BgsavVmh7UBP4Rg=";
  }) { };
  rutherther-mpris-ctl = pkgs.callPackage (pkgs.fetchFromGitHub {
    owner = "Rutherther";
    repo = "mpris-ctl";
    rev = "c5731a17d99553d79810791e5a5aff61344669d5";
    hash = "sha256-vxNpZ6VsGxqFoxl1IpWTqU4iS2g4rfepLXuzPrpvbko=";
  }) { };
}
