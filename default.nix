let
  pkgsSrc = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/1f9bd9246b1ea5af599a94a5104f3f207322be3e.tar.gz";
  };
  pkgs = import pkgsSrc {};
  inherit (pkgs) lib stdenv fetchurl;

  fixtures = lib.take 100 (lib.importJSON ./fixtures.json);
  paths = builtins.map (pair: toString (fetchurl pair)) fixtures;
in
stdenv.mkDerivation {
  name = "nix-parallel-test-case";
  src = null;

  phases = ["installPhase"];

  installPhase = ''
    echo ${toString paths} > $out
  '';
}
