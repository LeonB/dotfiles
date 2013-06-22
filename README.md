# LeonB's dotfiles #

## rbenv ##
This is something special: because you can't do inception on submodules you have to symlink `~/.rbenv/plugins` to `~/.rbenv-plugins`:

``` shell
cd .rbenv
ln -s ../.rbenv-plugins plugins
```
