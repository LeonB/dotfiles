filetype off "see: https://github.com/spf13/spf13-vim/pull/128
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Syntax / File types  / Indenting {{{1

    "Puppet niceties for your Vim setup
    Bundle 'rodjek/vim-puppet'

    " Vim/Ruby Configuration File
    Bundle 'vim-ruby/vim-ruby'

    "PHP-Correct-Indenting VIM script
    Bundle '2072/PHP-Indenting-for-VIm'

    "Automatic folding of PHP functions, classes,.. (also folds related PhpDoc)
    "Bundle 'phpfolding.vim'

    "Vim syntax file for scss (Sassy CSS)
    Bundle 'cakebaker/scss-syntax.vim'

    "precision colorscheme for the vim text editor
    Bundle 'altercation/vim-colors-solarized'

    " Vastly improved Javascript indentation and syntax support in Vim.
    Bundle "pangloss/vim-javascript"

    " CoffeeScript support for vim
    Bundle 'kchmck/vim-coffee-script'

    "Vim Markdown runtime files
    Bundle 'tpope/vim-markdown'

    " jinja plugins for vim (syntax and indent)
    Bundle 'lepture/vim-jinja'

" }}}1

" Color schemes {{{1

    " Moloikai color scheme
    Bundle 'vim-scripts/molokai'

    " Monokai colorschem
    Bundle 'sickill/vim-monokai'

    " Molokai color scheme for Vim
    "Bundle 'tomasr/molokai'

    "Color theme Hemisu
    Bundle 'noahfrederick/Hemisu'

    "Color theme Bad Wolf
    Bundle 'sjl/badwolf'

" }}}1

" Navigation {{{1

    " A tree explorer plugin for vim
    Bundle 'scrooloose/nerdtree'

    "easily switch between buffers
    Bundle 'jlanzarotta/bufexplorer'

    "Fuzzy file, buffer, mru and tag finder
    Bundle 'kien/ctrlp.vim'

    "recently opened/edited files
    Bundle 'mru.vim'

    "Fuzzy file, buffer, mru, tag, etc finder.
    Bundle 'kien/ctrlp.vim'

    "extended % matching for HTML
    Bundle 'matchit.zip'

    "Updates entries in a tags file automatically when saving
    " Bundle 'AutoTag'

    " Automated tag file generation and syntax highlighting of tags in Vim
    Bundle 'xolox/vim-easytags'
    Bundle 'xolox/vim-misc'

    " Vim plugin that displays tags in a window, ordered by class etc.
    Bundle 'majutsushi/tagbar'

" }}}1

" GUI {{{1

    " Highlight colors in css files
    "Bundle 'skammer/vim-css-color'
    Bundle 'ap/vim-css-color'

    "Highlights whitespace at the end of lines
    Bundle 'bitc/vim-bad-whitespace'

    "MatchParen for HTML tags
    "Bundle 'gregsexton/MatchTag'

    "The ultimate statusline/prompt utility
    " Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

    " super simple vim plugin to show the list of buffers in the command bar
    " Bundle 'bling/vim-bufferline'

    " lean & mean statusline for vim that's light as air
    " Bundle 'bling/vim-airline'

    "A modern side panel for Vim
    "Bundle 'mihaifm/vimpanel'

    " A vim plugin to display the indention levels with thin vertical lines
    " Bundle 'Yggdroot/indentLine'

    " Display your undo history in a graph.
    " Bundle 'mbbill/undotree'
" }}}1

" Commands {{{1

    " Perl/Ruby style regexp notation for Vim
    Bundle 'othree/eregex.vim'

    " Vim plugin for intensely orgasmic commenting
    Bundle 'scrooloose/nerdcommenter'

    "Syntax checking hacks for Vim"
    Bundle 'scrooloose/syntastic'

    "Provides insert mode auto-completion for quotes, parens, brackets, etc
    " Bundle 'Raimondi/delimitMate'

    "Vim script for text filtering and alignment
    Bundle 'godlygeek/tabular'

    ":substitute preview
    Bundle 'osyo-manga/vim-over'

" }}}1

" Text objects {{{1

    "quoting/parenthesizing made simple
    Bundle 'tpope/vim-surround'

    " Vim plugin: Text objects for functions
    Bundle 'kana/vim-textobj-function'
    Bundle 'kana/vim-textobj-user'

    " Vim plugin that defines a new text object representing lines of code at
    " the same indent level. Useful for python/vim scripts, etc
    Bundle 'michaeljsmith/vim-indent-object'

" }}}1

" Libs {{{1

    "enable repeating supported plugin maps with \".\"
    Bundle 'tpope/vim-repeat'

" }}}1

" Config {{{1

    " EditorConfig plugin for Vim http://editorconfig.org
    " #slow-on-sshfs
    Bundle 'editorconfig/editorconfig-vim'

    " sensible.vim: Defaults everyone can agree on
    Bundle 'tpope/vim-sensible'

" }}}1
