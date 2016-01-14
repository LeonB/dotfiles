" runtime plugin/install_vundle.vim
" call AutoInstallVundle()

filetype off "see: https://github.com/spf13/spf13-vim/pull/128
if has ('vim_starting')
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.config/nvim/bundle/'))

if neobundle#load_cache()
  " It returns 1, if the cache file is old or invalid or not found.
  runtime bundles.vim
  NeoBundleSaveCache
endif

call neobundle#end()
