" runtime plugin/install_vundle.vim
" call AutoInstallVundle()

filetype off "see: https://github.com/spf13/spf13-vim/pull/128
if has ('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoNeoBundle manage NeoNeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
" NeoNeoBundleCheck

" Syntax / File types  / Indenting {{{1

    "Puppet niceties for your Vim setup
    NeoBundle 'rodjek/vim-puppet'

    " Vim/Ruby Configuration File
    NeoBundle 'vim-ruby/vim-ruby'

    "PHP-Correct-Indenting VIM script
    NeoBundle '2072/PHP-Indenting-for-VIm'

    " Cutting-edge vim css syntax file
    NeoBundle 'JulesWang/css.vim'

    "Vim syntax file for scss (Sassy CSS)
    NeoBundle 'cakebaker/scss-syntax.vim'

    " Vastly improved Javascript indentation and syntax support in Vim.
    NeoBundle "pangloss/vim-javascript"

    " CoffeeScript support for vim
    NeoBundle 'kchmck/vim-coffee-script'

    "Vim Markdown runtime files
    NeoBundle 'tpope/vim-markdown'

    " jinja plugins for vim (syntax and indent)
    NeoBundle 'lepture/vim-jinja'

    " Github mirror of Go vimscripts, synced with main repository
    " http://golang.org
    NeoBundle 'jnwhiteh/vim-golang'

    " Add additional support for Ansible in VIM
    NeoBundle 'chase/vim-ansible-yaml'

" }}}1

" Color schemes {{{1

    " Monokai colorschem
    NeoBundle 'sickill/vim-monokai'

    " Molokai color scheme for Vim
    NeoBundle 'tomasr/molokai'

    "Color theme Hemisu
    NeoBundle 'noahfrederick/Hemisu'

    "Color theme Bad Wolf
    NeoBundle 'sjl/badwolf'

    "precision colorscheme for the vim text editor
    NeoBundle 'altercation/vim-colors-solarized'

    " Dark, high contrast vim colorscheme
    NeoBundle 'MaxSt/FlatColor'

    " Dark, high contrast gvim colorscheme inspired by molokai and bad wolf.
    NeoBundle 'nielsmadan/harlequin'

    " precision colorscheme for the vim text editor
    NeoBundle 'altercation/vim-colors-solarized'

    " a low-contrast Vim color scheme based on Seoul Colors
    NeoBundle 'junegunn/seoul256.vim'

    " A GUI & 256 color port of the Railscasts Textmate theme to Vim
    NeoBundle 'dhruvasagar/vim-railscasts-theme'

    " Sexier version of Railscasts vim color scheme / theme
    NeoBundle 'oguzbilgic/sexy-railscasts-theme'

    " The original IR_Black color scheme for vim
    NeoBundle 'twerth/ir_black'

    " A colorful, dark color scheme for Vim
    NeoBundle 'nanotech/jellybeans.vim'

    " Gary Bernhardt's grb256 vim theme packaged to work with Pathogen/Vundle
    NeoBundle 'quanganhdo/grb256'

    " codeschool vim theme
    NeoBundle '29decibel/codeschool-vim-theme'

    " Zenburn is a low-contrast color scheme for Vim
    NeoBundle 'jnurmine/Zenburn'

    " A fork of desert256.vim aims to make it a bit warm and more friendly for
    " my eyes.
    NeoBundle 'rainux/vim-desert-warm-256'

    " A slightly-modified desert theme, for 88- and 256-color xterms
    NeoBundle 'vim-scripts/desert256.vim'

    " summerfruit color scheme in 256 colors
    NeoBundle 'vim-scripts/summerfruit256.vim'

    " light color scheme
    NeoBundle 'therubymug/vim-pyte'

    " Color scheme for the Gnome2 "nuvola" theme
    NeoBundle 'vim-scripts/nuvola.vim'

" }}}1

" Navigation {{{1

    " Powerful file explorer implemented by Vim script
    NeoBundle 'Shougo/vimfiler.vim'

    " Unite and create user interfaces
    NeoBundle 'Shougo/unite.vim'

    " MRU plugin includes unite.vim MRU sources
    NeoBundle 'Shougo/neomru.vim'

    "extended % matching for HTML
    NeoBundle 'matchit.zip'

    "Updates entries in a tags file automatically when saving
    " NeoBundle 'craigemery/vim-autotag'

    " Automated tag file generation and syntax highlighting of tags in Vim
    " #slow-on-sshfs
    " NeoBundle 'xolox/vim-easytags'
    " NeoBundle 'xolox/vim-misc'

    " Vim plugin that displays tags in a window, ordered by class etc.
    NeoBundle 'majutsushi/tagbar'

    " A 'jump to previous buffer' command that behaves as you would expect
    NeoBundle 'LeonB/vim-previous-buffer'

" }}}1

" GUI {{{1

    " Highlight colors in css files
    NeoBundle 'ap/vim-css-color'

    "Highlights whitespace at the end of lines
    " NeoBundle 'bitc/vim-bad-whitespace'

" }}}1

" Commands {{{1

    " commentary.vim: comment stuff out
    NeoBundle 'tpope/vim-commentary'

    "Syntax checking hacks for Vim"
    " NeoBundle 'scrooloose/syntastic'

    "Provides insert mode auto-completion for quotes, parens, brackets, etc
    NeoBundle 'Raimondi/delimitMate'

    " https://github.com/Townk/vim-autoclose
    " https://github.com/jiangmiao/auto-pairs

    "Vim script for text filtering and alignment
    NeoBundle 'godlygeek/tabular'

    " This is an atomic save function for vim
    NeoBundle 'vim-scripts/Atomic-Save'

    " Delete buffers and close files in Vim without closing your windows or
    " messing up your layout
    NeoBundle 'moll/vim-bbye'

" }}}1

" Text objects {{{1

    "quoting/parenthesizing made simple
    NeoBundle 'tpope/vim-surround'

    "Vim plugin that provides additional text objects (pair, quote, separator)
    NeoBundle 'wellle/targets.vim'

    " Vim plugin: Text objects for functions
    " NeoBundle 'kana/vim-textobj-function'
    " NeoBundle 'kana/vim-textobj-user'

    " Vim plugin that defines a new text object representing lines of code at
    " the same indent level. Useful for python/vim scripts, etc
    NeoBundle 'michaeljsmith/vim-indent-object'

    "Vim text objects for search matches
    NeoBundle 'Raimondi/vim_search_objects'

" }}}1

" Libs {{{1

    "enable repeating supported plugin maps with \".\"
    NeoBundle 'tpope/vim-repeat'

    " Find out which project a file belongs to, easy to use in scripts/mappings
    NeoBundle 'dbakker/vim-projectroot'

    " Vim plugin: Testing framework for Vim script
    NeoBundle 'kana/vim-vspec'

    " Interactive command execution in Vim.
    NeoBundle 'Shougo/vimproc', {
                \ 'build' : {
                \     'windows' : 'make -f make_mingw32.mak',
                \     'cygwin' : 'make -f make_cygwin.mak',
                \     'mac' : 'make -f make_mac.mak',
                \     'unix' : 'make -f make_unix.mak',
                \    },
                \ }

" }}}1

" Config {{{1

    " EditorConfig plugin for Vim http://editorconfig.org
    " #slow-on-sshfs
    if has("python")
        NeoBundle 'editorconfig/editorconfig-vim'
    endif

" }}}
