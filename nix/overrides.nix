{ pkgs }:

self: super:

with { inherit (pkgs.stdenv) lib; };

with pkgs.haskell.lib;

{
  dspec = (
    with rec {
      dspecSource = pkgs.lib.cleanSource ../.;
      dspecBasic  = self.callCabal2nix "dspec" dspecSource { };
    };
    overrideCabal dspecBasic (old: {
    })
  );
}
