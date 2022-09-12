{} :

let nixpkgs = import (builtins.fetchTarball {
        # use exactly same commit in nixpkgs as nix-init.sh here:
        url = "https://github.com/NixOS/nixpkgs/archive/ee01de29d2f58d56b1be4ae24c24bd91c5380cea.tar.gz";}) {};
    thinner = x:
      nixpkgs.haskell.lib.disableLibraryProfiling
        (nixpkgs.haskell.lib.dontHaddock (nixpkgs.haskell.lib.dontCheck x));
    patat = thinner (nixpkgs.haskellPackages.callCabal2nix "patat"
        (builtins.fetchGit {
          name = "patat";
          url = "https://github.com/jaspervdj/patat";
          rev = "da1377471171755ec51b1335c169b35b4ca9a9a2";
	}) { });

in nixpkgs.mkShell {
	packages = [ patat ];
}
