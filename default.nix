let
  pkgsSrc = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/1f9bd9246b1ea5af599a94a5104f3f207322be3e.tar.gz";
  };
  pkgs = import pkgsSrc {};
  inherit (pkgs) lib stdenv fetchurl;

  srcs = lib.take 100 (import ./fixtures.nix);
  srcPaths = builtins.map (pair: toString (fetchurl pair)) srcs;
in
stdenv.mkDerivation {
  name = "nix-parallel-test-case";
  src = null;

  phases = ["installPhase"];

  installPhase = ''
    echo ${toString srcPaths} > $out
  '';
}
