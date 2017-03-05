let
  nixpkgs = (import <nixpkgs> {}).srcOnly {
    name = "nixpkgs";
    src = import <nix/fetchurl.nix> {
      url = "https://github.com/NixOS/nixpkgs/archive/1f9bd9246b1ea5af599a94a5104f3f207322be3e.tar.gz";
      sha256 = "005ax3r50z2czlnpyshggxcnbg2dpxiwasr7w1yri1bqvnnqhi0g";
    };
  };

  pkgs = import nixpkgs {};

  inherit (pkgs) lib stdenv fetchurl buildEnv;
  #fetchurl = import <nix/fetchurl.nix>;

in
  {
    deps = buildEnv {
      name = "deps";
      paths = with pkgs; [
        nixpkgs
        stdenv

        curl curl.dev curl.man
        libev
        libssh2 libssh2.dev
        nghttp2 nghttp2.dev
        openssl openssl.dev
        perl
      ];
    };
    test =
      let
        fixtures = lib.take 100 (lib.importJSON ./fixtures.json);
        fixturePaths = builtins.map (pair: toString (fetchurl pair)) fixtures;

      in
      stdenv.mkDerivation {
        name = "nix-parallel-test-case";
        src = null;
        phases = ["installPhase"];
        # Just create links to all the fixture derivations
        installPhase = ''
            echo ${toString fixturePaths} > $out
        '';
      };
  }
