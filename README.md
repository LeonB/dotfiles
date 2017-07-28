# LeonB's dotfiles #

## Installing

``` shell
git clone https://github.com/LeonB/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
bin/dfm
git submodule init
```

## Setting up neovim

``` shell
brew install neovim
git submodule update .config/nvim/bundle/neobundle.vim
nvim -c "NeoBundleInstall" -c 'qa!'
```

## rbenv ##
This is something special: because you can't do inception on submodules you have to symlink `~/.rbenv/plugins` to `~/.rbenv-plugins`:

``` shell
cd .rbenv
ln -s ../.rbenv-plugins plugins
```
