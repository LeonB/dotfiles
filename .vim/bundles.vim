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

    " Add additional support for Ansible in VIM
    NeoBundle 'chase/vim-ansible-yaml'

    " nginx vim syntax
    NeoBundle 'evanmiller/nginx-vim-syntax'

    " Vim syntax highlighting for Blade templates.
    NeoBundle 'xsbeats/vim-blade'

    " Go development plugin for Vim
    NeoBundle 'fatih/vim-go'

    " Retro groove color scheme for Vim
    NeoBundle 'morhetz/gruvbox'

    " mustache and handlebars mode for vim
    NeoBundle 'mustache/vim-mustache-handlebars'

    " A better JSON for Vim
    NeoBundle 'elzr/vim-json'

    " Twig syntax highlighting, snipMate, etc.
    NeoBundle 'evidens/vim-twig'

" }}}1

" (Omni)completion {{{1

    " Improved PHP omnicompletion
    NeoBundle 'shawncplus/phpcomplete.vim'

    " php manual doc
    NeoBundle 'drwX/php-manual.vim'

    NeoBundle 'tobyS/pdv', {'depends' :
                \ [ 'tobyS/vmustache',
                \ ]}

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

    " A colorscheme and syntax for Vim
    NeoBundle 'itchyny/landscape.vim'

    " A dark theme for Atom, Alfred, Chrome DevTools, iTerm, Sublime Text,
    " Textmate, Terminal.app, Vim, Xcode, Zsh
    " look into on_source
    NeoBundle 'zenorocha/dracula-theme', {'rtp' : 'vim'}

    NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim'}

    " A vim colorscheme based on Github's syntax highlighting.
    NeoBundle 'endel/vim-github-colorscheme'

    " Dark-background GUI color scheme
    NeoBundle 'vim-scripts/Liquid-Carbon'

    " A slightly modified version of the original mustang-colorscheme for vim by hcalves.
    NeoBundle 'croaker/mustang-vim'

    " Spiritual successor to Skittles Dark
    NeoBundle 'shawncplus/skittles_berry'

    " Port of the Sunburst TextMate theme to Vim
    NeoBundle 'gigamo/sunburst.vim'

    " A(nother) port of TextMate's Twilight theme to Vim.
    NeoBundle 'matthewtodd/vim-twilight'

    " Wombat for 256 color xterms
    NeoBundle 'vim-scripts/wombat256.vim'

    " Dark gray color scheme sharing some similarities with Desert
    NeoBundle 'vim-scripts/Wombat'

    " Lucius color scheme for vim
    NeoBundle 'jonathanfilip/vim-lucius'

    " Vim color scheme
    NeoBundle 'zeis/vim-kolor'

    " Let's keep Vim warm
    NeoBundle 'nice/sweater'

" }}}1

" Navigation {{{1

    " Powerful file explorer implemented by Vim script
    NeoBundle 'Shougo/vimfiler'

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
    NeoBundle 'xolox/vim-easytags'
    NeoBundle 'xolox/vim-misc'

    " Ctags generator for Vim (written in Vimscript)
    " NeoBundle 'szw/vim-tags'

    " Vim plugin that displays tags in a window, ordered by class etc.
    NeoBundle 'majutsushi/tagbar'

    " A 'jump to previous buffer' command that behaves as you would expect
    NeoBundle 'LeonB/vim-previous-buffer', {
                \ 'autoload': {'commands': ['PreviousBuffer']}
                \ }

" }}}1

" GUI {{{1

    " Highlight colors in css files
    NeoBundle 'ap/vim-css-color'

    " A light and configurable statusline/tabline for Vim
    NeoBundle 'itchyny/lightline.vim'

" }}}1

" Commands {{{1

    " commentary.vim: comment stuff out
    NeoBundle 'tpope/vim-commentary'

    "Syntax checking hacks for Vim"
    NeoBundle 'scrooloose/syntastic'

    "Provides insert mode auto-completion for quotes, parens, brackets, etc
    NeoBundle 'Raimondi/delimitMate'

    "Vim script for text filtering and alignment
    NeoBundle 'godlygeek/tabular'

    " This is an atomic save function for vim
    NeoBundle 'vim-scripts/Atomic-Save'

    " Delete buffers and close files in Vim without closing your windows or
    " messing up your layout
    NeoBundle 'moll/vim-bbye'

    " Yet Another Posting Script reborn
    NeoBundle 'guyzmo/vim-yaposting'

" }}}1

" Text objects {{{1

    "quoting/parenthesizing made simple
    " NeoBundle 'tpope/vim-surround'
    NeoBundle 'tpope/vim-surround'

    "Vim plugin that provides additional text objects (pair, quote, separator)
    NeoBundle 'wellle/targets.vim'

    " Vim plugin: Text objects for functions
    NeoBundle 'kana/vim-textobj-user'

    " Vim plugin: Text objects for functions
    NeoBundle 'kana/vim-textobj-function', {'depends': 'kana/vim-textobj-user'}

    " Text object for php functions
    NeoBundle 'kentaro/vim-textobj-function-php', {'depends': 'kana/vim-textobj-user'}

    " Vim plugin: Text objects for the current line
    NeoBundle 'kana/vim-textobj-line'

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
