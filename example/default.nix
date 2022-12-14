let
  nixpkgs = (import (builtins.fetchTarball {
    url =
      "https://github.com/NixOS/nixpkgs/archive/d1c3fea7ecbed758168787fe4e4a3157e52bc808.tar.gz";
    sha256 = "sha256:0ykm15a690v8lcqf2j899za3j6hak1rm3xixdxsx33nz7n3swsyy";
  })) { };

  pureBuildFunction = pkgs : src : system :
    with pkgs;
     derivation {
      name = "simple";
      builder = "${bash}/bin/bash";
      args = [ ./builder.sh ];
      inherit src system gcc coreutils;
    };

in pureBuildFunction nixpkgs ./simple.c "x86_64-darwin"