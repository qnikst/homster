{ nixpkgs ? <nixpkgs> }:
import nixpkgs {
  config = { allowUnfree = true; };
  overlays = [
    (import ../elemir-overlay nixpkgs)
  ];
}
