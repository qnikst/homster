# h0mster

*homster* - system for the management of the home folder and installation
and packages configuration. This installation should be portable across any
linux (and MacOS) distribution as long as [nix](https://nixos.org/nix/) is
installed there.

This project is based on the [homies](https://github.com/nmattia/homies) project written by @nmattia.

# Installation

Checkout project into your folder:
```
git clone https://github.com/qnikst/homster.git
```

Install all packages from environment, and remove other packages managed by nix
```
nix-env -f homster -i --remove-all
```

TODO: installation on non-nixos, refer to homies project for instructions
TODO: more configurable checkout, so anyone can reuse this project.

