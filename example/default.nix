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
      builder = "${pkgs.bash}/bin/bash";
      args = [ ./builder.sh ];
      gcc = pkgs.gcc;
      coreutils = pkgs.coreutils;
      src = src;
      system = builtins.currentSystem;
    };

in pureBuildFunction nixpkgs ./simple.c builtins.currentSystem