" runtime plugin/install_vundle.vim
" call AutoInstallVundle()

filetype off "see: https://github.com/spf13/spf13-vim/pull/128
if has ('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

if neobundle#has_cache()
    NeoBundleLoadCache
else
    runtime bundles.vim
    NeoBundleSaveCache
endif
