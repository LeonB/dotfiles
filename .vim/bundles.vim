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
    " NeoBundle 'jnwhiteh/vim-golang'

    " Add additional support for Ansible in VIM
    NeoBundle 'chase/vim-ansible-yaml'

    " nginx vim syntax
    NeoBundle 'evanmiller/nginx-vim-syntax'

    " Vim syntax highlighting for Blade templates.
    NeoBundle 'xsbeats/vim-blade'

    " Go development plugin for Vim
    NeoBundle 'fatih/vim-go'

" }}}1

" Color schemes {{{1

    " Monokai colorschem
    NeoBundle 'sickill/vim-monokai'

    " Molokai color scheme for Vim
    " NeoBundle 'tomasr/molokai'

    " Molokai color scheme for Vim (modified)
    NeoBundle 'fatih/molokai'

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

    " A colorscheme and syntax for Vim
    NeoBundle 'itchyny/landscape.vim'

    " A dark theme for Atom, Alfred, Chrome DevTools, iTerm, Sublime Text,
    " Textmate, Terminal.app, Vim, Xcode, Zsh
    " look into on_source
    NeoBundle 'zenorocha/dracula-theme', { 'rtp' : 'vim' }

" }}}1

" Navigation {{{1

    " Powerful file explorer implemented by Vim script
    NeoBundleLazy 'Shougo/vimfiler', {
                \ 'depends' : ['Shougo/unite.vim'],
                \ 'autoload': { 'commands': ['VimFilerTab', 'VimFiler', 'VimFilerExplorer']}
                \ }

    " Unite and create user interfaces
    NeoBundleLazy 'Shougo/unite.vim', {
                \ 'autoload': {'commands': ['Unite', 'UniteResume']}
                \ }

    " MRU plugin includes unite.vim MRU sources
    NeoBundleLazy 'Shougo/neomru.vim', {
                \ 'autoload': {'unite_sources': ['file_mru']}
                \ }

    "extended % matching for HTML
    NeoBundleLazy 'matchit.zip', {
                \ 'autoload': {'filetypes': ['html', 'xml']}
                \ }

    "Updates entries in a tags file automatically when saving
    " NeoBundle 'craigemery/vim-autotag'

    " Automated tag file generation and syntax highlighting of tags in Vim
    " #slow-on-sshfs
    " NeoBundle 'xolox/vim-easytags'
    " NeoBundle 'xolox/vim-misc'

    " Vim plugin that displays tags in a window, ordered by class etc.
    NeoBundleLazy 'majutsushi/tagbar', {
                \ 'autoload': {'commands': ['TagbarToggle']}
                \ }

    " A 'jump to previous buffer' command that behaves as you would expect
    NeoBundle 'LeonB/vim-previous-buffer', {
                \ 'autoload': {'commands': ['PreviousBuffer']}
                \ }

" }}}1

" GUI {{{1

    " Highlight colors in css files
    NeoBundleLazy 'ap/vim-css-color', {
                \ 'autoload': {'filetypes': ['css', 'html', 'sass', 'scss']}
                \ }

    " A light and configurable statusline/tabline for Vim
    NeoBundle 'itchyny/lightline.vim'

" }}}1

" Commands {{{1

    " commentary.vim: comment stuff out
    NeoBundleLazy 'tpope/vim-commentary', {
                \ 'autoload': {'mappings': ['cgc', 'gc']}}

    "Syntax checking hacks for Vim"
    NeoBundle 'scrooloose/syntastic'

    "Provides insert mode auto-completion for quotes, parens, brackets, etc
    NeoBundle 'Raimondi/delimitMate'

    "Vim script for text filtering and alignment
    NeoBundleLazy 'godlygeek/tabular', {
                \ 'autoload': { 'commands': ['Tabularze']}}

    " This is an atomic save function for vim
    NeoBundleLazy 'vim-scripts/Atomic-Save', {
                \ 'autoload': { 'commands': ['AtomicSave']}}

    " Delete buffers and close files in Vim without closing your windows or
    " messing up your layout
    NeoBundle 'moll/vim-bbye'

" }}}1

" Text objects {{{1

    "quoting/parenthesizing made simple
    " NeoBundle 'tpope/vim-surround'
    NeoBundleLazy 'tpope/vim-surround', {
                \ 'autoload': {
                \   'mappings': ['ds', 'cs', 'ys', 'yS', 'S', 'gS'],
                \ }}

    "Vim plugin that provides additional text objects (pair, quote, separator)
    NeoBundle 'wellle/targets.vim'

    " Vim plugin: Text objects for functions
    NeoBundle 'kana/vim-textobj-user'

    " Vim plugin: Text objects for functions
    NeoBundle 'kana/vim-textobj-function', {'depends': 'kana/vim-textobj-user'}

    " Text object for php functions
    NeoBundle 'kentaro/vim-textobj-function-php', {'depends': 'kana/vim-textobj-user'}

    " Vim plugin that defines a new text object representing lines of code at
    " the same indent level. Useful for python/vim scripts, etc
    NeoBundle 'michaeljsmith/vim-indent-object'

    "Vim text objects for search matches
    NeoBundle 'Raimondi/vim_search_objects'

    " Vim plugin that adds a new url text object
    NeoBundle 'LeonB/vim-textobj-url', {'depends': 'kana/vim-textobj-user'}

" }}}1

" Libs {{{1

    "enable repeating supported plugin maps with \".\"
    NeoBundleLazy 'tpope/vim-repeat', {'autoload': {'mappings': '.'}}

    " Find out which project a file belongs to, easy to use in scripts/mappings
    NeoBundleLazy 'dbakker/vim-projectroot', {
                \ 'autoload': {
                \  'commands': [
                \  'ProjectBufArgs',
                \  'ProjectBufDo',
                \  'ProjectBufFirst',
                \  'ProjectBufLast',
                \  'ProjectBufNext',
                \  'ProjectBufPrev',
                \  'ProjectRootCD',
                \  'ProjectRootExe',
                \  'ProjectRootLCD',
                \ ],
                \ 'functions': 'ProjectRootGet'}}

    " Vim plugin: Testing framework for Vim script
    NeoBundleLazy 'kana/vim-vspec'

    " Interactive command execution in Vim.
    NeoBundle 'Shougo/vimproc', {
                \ 'build' : {
                \     'windows' : 'make -f make_mingw32.mak',
                \     'cygwin' : 'make -f make_cygwin.mak',
                \     'mac' : 'make -f make_mac.mak',
                \     'unix' : 'make -f make_unix.mak',
                \    },
                \ }

    " Vim interface to Web API
    NeoBundle 'mattn/webapi-vim'

" }}}1

" Utilities {{{1

    " Syntax checking hacks for vim
    NeoBundle 'scrooloose/syntastic'

" }}}1

" Config {{{1

    " EditorConfig plugin for Vim http://editorconfig.org
    " #slow-on-sshfs
    if has("python")
        NeoBundle 'editorconfig/editorconfig-vim'
    endif

" }}}
