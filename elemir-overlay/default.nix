nixpkgs:
let
  pkgs = import nixpkgs { config = {}; overlays = []; };
  fetchJSON = pkgs.callPackage ../lib/build-support/fetch-json.nix {};
in
  import (fetchJSON ./default.src.json)
