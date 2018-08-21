# Git, with a git config baked in (see ./config)
{ git, symlinkJoin, makeWrapper }:

git.overrideAttrs (old: {
  configureFlags = [ "--with-gitconfig=$out/etc/gitconfig" ];
  postInstall = ''
    mkdir $out/etc/
    cp "${./gitconfig}" $out/etc/gitconfig
  '';
})
