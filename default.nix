let
  # We use default configuration on PC
  # This lets user to update package config on each PC by adding
  # additional configuration to .config/nixpkgs/config.nix
  pkgs = import ./nixpkgs {};
  homster =
    [
    # customized packages
    git
    tmux
    vim
    # systeem wide packages
    pkgs.ag
    pkgs.curl
    pkgs.htop
    pkgs.zathura
    pkgs.nix
    pkgs.tree
    pkgs.xclip
    pkgs.mosh
    pkgs.tdesktop
    ];

  # Tmux with a custom tmux.conf baked in
  tmux = import ./tmux (with pkgs;
    { inherit
        symlinkJoin
        makeWrapper
        writeText
        ;
      tmux = pkgs.tmux;
    });

  # Vim with a custom vimrc and set of packages
  vim = import ./vim (with pkgs;
    {inherit
        makeWrapper
        symlinkJoin
        vim_configurable
        vimUtils
        vimPlugins
        haskellPackages;
    });

  # Git with config baked in
  git = import ./git (with pkgs;
    { inherit
        makeWrapper
        symlinkJoin
        ;
      git = pkgs.git;
    });

in homster
