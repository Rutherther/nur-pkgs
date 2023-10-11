# This file describes your repository contents.
# It should return a set of nix derivations
# and optionally the special attributes `lib`, `modules` and `overlays`.
# It should NOT import <nixpkgs>. Instead, you should take pkgs as an argument.
# Having pkgs default to <nixpkgs> is fine though, and it lets you use short
# commands such as:
#     nix-build -A mypackage

{ pkgs ? import <nixpkgs> {} }: let
  rutherther-sequence-detector = pkgs.fetchFromGitHub {
    owner = "Rutherther";
    repo = "sequence-detector";
    rev = "c447c0d83877907c3ade8a2e9b4f659d4ef92904";
    sha256 = "06719x0fv8arpld0n1kwc0v507gpbqjp3sx3kin72441fq9qi3q6";
  };

  rutherther-mpris-ctl = pkgs.fetchFromGitHub {
    owner = "Rutherther";
    repo = "mpris-ctl";
    rev = "c5731a17d99553d79810791e5a5aff61344669d5";
    sha256 = "0jkfdyx3xcvv5nlzgb9qd15j4km9jfaj4x8rlf2il6vclmknj4xz";
  };
in {
  lib = import ./lib { inherit pkgs; }; # functions
  modules = import ./modules; # NixOS modules
  overlays = import ./overlays; # nixpkgs overlays

  firefoxpwa = pkgs.callPackage ./pkgs/firefoxpwa { };
  firefoxpwa-unwrapped = pkgs.callPackage ./pkgs/firefoxpwa/unwrapped.nix { };

  rutherther-sequence-detector = pkgs.callPackage "${rutherther-sequence-detector}" { };
  rutherther-mpris-ctl = pkgs.callPackage "${rutherther-mpris-ctl}" { };
}
