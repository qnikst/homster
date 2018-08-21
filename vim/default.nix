{ symlinkJoin, makeWrapper, vim_configurable, vimUtils, vimPlugins, haskellPackages }:
let
  pluginDictionaries = with vimPlugins;
    [
      ctrlp
      fugitive
      gitgutter
      nerdcommenter
      nerdtree
      surround
      syntastic
      tmux-navigator
      vim-airline
      vim-indent-guides
      vim-markdown
      vim-multiple-cursors
      vim-nix
      vim-trailing-whitespace
      vimproc
      youcompleteme
    ];
  customRC = vimUtils.vimrcFile
    { customRC = builtins.readFile ./vimrc;
    #  packages.mvc.start = extraPackages;
    };
in
symlinkJoin {
  name = "vim";
  buildInputs = [makeWrapper];
  postBuild = ''
    wrapProgram "$out/bin/vim" \
        --add-flags "-u ${customRC}" \
        --prefix PATH : ${haskellPackages.hasktags}/bin
  '';
  paths = [ vim_configurable ];
}
