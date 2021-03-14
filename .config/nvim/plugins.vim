" Syntax / File types  / Indenting {{{1

    "Puppet niceties for your Vim setup
    " Plug 'rodjek/vim-puppet'

    " Vim/Ruby Configuration File
    " Plug 'vim-ruby/vim-ruby'

    "PHP-Correct-Indenting VIM script
    Plug '2072/PHP-Indenting-for-VIm'

    " Cutting-edge vim css syntax file
    Plug 'JulesWang/css.vim'

    "Vim syntax file for scss (Sassy CSS)
    Plug 'cakebaker/scss-syntax.vim'

    " Vastly improved Javascript indentation and syntax support in Vim.
    Plug 'pangloss/vim-javascript'

    " CoffeeScript support for vim
    " Plug 'kchmck/vim-coffee-script'

    "Vim Markdown runtime files
    Plug 'tpope/vim-markdown'

    " jinja plugins for vim (syntax and indent)
    Plug 'lepture/vim-jinja'

    " Add additional support for Ansible in VIM
    Plug 'chase/vim-ansible-yaml'

    " nginx vim syntax
    Plug 'chr4/nginx.vim'

    " Vim syntax highlighting for Blade templates.
    Plug 'xsbeats/vim-blade'

    " Go development plugin for Vim
    " Plug 'fatih/vim-go', { 'rev': '*' })
    Plug 'fatih/vim-go'

    " mustache and handlebars mode for vim
    " Plug 'mustache/vim-mustache-handlebars'

    " A better JSON for Vim
    " Plug 'elzr/vim-json'

    " Twig syntax highlighting, snipMate, etc.
    Plug 'qbbr/vim-twig'

    " Arduino syntax files for Vim http://hardwarefun.com/projects/
    Plug 'sudar/vim-arduino-syntax'

    " Syntax highlighting for jq files in vim/neovim
    Plug 'vito-c/jq.vim'

    " A Vim plugin that provides GraphQL file detection, syntax highlighting, and indentation.
    Plug 'jparise/vim-graphql'

" }}}1

" (Omni)completion {{{1

    " Improved PHP omnicompletion
    " Plug 'shawncplus/phpcomplete.vim'

    " php manual doc
    Plug 'drwX/php-manual.vim'

    " Plug 'autozimu/LanguageClient-neovim', {
    "             \ 'rev': 'next',
    "             \ 'build': 'bash install.sh',
    "             \ })

    " Plug 'tobyS/pdv', {'depends' :)
    "             \ [
    "             \   'tobyS/vmustache',
    "             \   'SirVer/ultisnips',
    "             \ ]}

" }}}1

" Color schemes {{{1

    " Monokai colorschem
    Plug 'sickill/vim-monokai'

    " Wombat for 256 color xterms
    Plug 'vim-scripts/wombat256.vim'

    " Molokai color scheme for Vim
    Plug 'tomasr/molokai'

    "Color theme Hemisu
    Plug 'noahfrederick/Hemisu'

    "Color theme Bad Wolf
    Plug 'sjl/badwolf'

    "precision colorscheme for the vim text editor
    Plug 'altercation/vim-colors-solarized'

    " Dark, high contrast vim colorscheme
    Plug 'MaxSt/FlatColor'

    " Dark, high contrast gvim colorscheme inspired by molokai and bad wolf.
    Plug 'nielsmadan/harlequin'

    " precision colorscheme for the vim text editor
    Plug 'altercation/vim-colors-solarized'

    " a low-contrast Vim color scheme based on Seoul Colors
    Plug 'junegunn/seoul256.vim'

    " A GUI & 256 color port of the Railscasts Textmate theme to Vim
    Plug 'dhruvasagar/vim-railscasts-theme'

    " Sexier version of Railscasts vim color scheme / theme
    Plug 'oguzbilgic/sexy-railscasts-theme'

    " The original IR_Black color scheme for vim
    Plug 'twerth/ir_black'

    " A colorful, dark color scheme for Vim
    Plug 'nanotech/jellybeans.vim'

    " Gary Bernhardt's grb256 vim theme packaged to work with Pathogen/Vundle
    Plug 'quanganhdo/grb256'

    " codeschool vim theme
    Plug '29decibel/codeschool-vim-theme'

    " Zenburn is a low-contrast color scheme for Vim
    Plug 'jnurmine/Zenburn'

    " A fork of desert256.vim aims to make it a bit warm and more friendly for
    " my eyes.
    Plug 'rainux/vim-desert-warm-256'

    " A slightly-modified desert theme, for 88- and 256-color xterms
    Plug 'vim-scripts/desert256.vim'

    " summerfruit color scheme in 256 colors
    Plug 'vim-scripts/summerfruit256.vim'

    " light color scheme
    Plug 'therubymug/vim-pyte'

    " Color scheme for the Gnome2 "nuvola" theme
    Plug 'vim-scripts/nuvola.vim'

    " A colorscheme and syntax for Vim
    Plug 'itchyny/landscape.vim'

    " A dark theme for Atom, Alfred, Chrome DevTools, iTerm, Sublime Text,
    " Textmate, Terminal.app, Vim, Xcode, Zsh
    " look into on_source
    Plug 'zenorocha/dracula-theme'

    Plug 'chriskempson/tomorrow-theme'

    " A vim colorscheme based on Github's syntax highlighting.
    Plug 'endel/vim-github-colorscheme'

    " Dark-background GUI color scheme
    Plug 'vim-scripts/Liquid-Carbon'

    " A slightly modified version of the original mustang-colorscheme for vim by hcalves.
    Plug 'croaker/mustang-vim'

    " Spiritual successor to Skittles Dark
    Plug 'shawncplus/skittles_berry'

    " Port of the Sunburst TextMate theme to Vim
    Plug 'gigamo/sunburst.vim'

    " A(nother) port of TextMate's Twilight theme to Vim.
    Plug 'matthewtodd/vim-twilight'

    " Dark gray color scheme sharing some similarities with Desert
    Plug 'vim-scripts/Wombat'

    " Lucius color scheme for vim
    Plug 'jonathanfilip/vim-lucius'

    " Vim color scheme
    Plug 'zeis/vim-kolor'

    " Let's keep Vim warm
    Plug 'nice/sweater'

    " Retro groove color scheme for Vim
    Plug 'morhetz/gruvbox'

    " The colorscheme with neovim in mind
    Plug 'freeo/vim-kalisi'

    Plug 'geoffharcourt/one-dark.vim'

" }}}1

" Navigation {{{1

    " Powerful file explorer implemented by Vim script
    Plug 'Shougo/vimfiler'

    " The dark powered file explorer implementation
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

    " Unite and create user interfaces
    Plug 'Shougo/unite.vim'

    " MRU plugin includes unite.vim MRU sources
    Plug 'Shougo/neomru.vim'

    "extended % matching for HTML
    Plug 'vim-scripts/matchit.zip'

    "Updates entries in a tags file automatically when saving
    " Plug 'craigemery/vim-autotag'

    " Automated tag file generation and syntax highlighting of tags in Vim
    " #slow-on-sshfs
    " Plug 'xolox/vim-easytags'
    " Plug 'xolox/vim-misc'

    " Ctags generator for Vim (written in Vimscript)
    " Plug 'szw/vim-tags'

    " Vim plugin that displays tags in a window, ordered by class etc.
    Plug 'majutsushi/tagbar'

    " A 'jump to previous buffer' command that behaves as you would expect
    Plug 'LeonB/vim-previous-buffer'

    Plug 'jeffkreeftmeijer/vim-numbertoggle'

" }}}1

" GUI {{{1

    " Highlight colors in css files
    Plug 'ap/vim-css-color'

    " A light and configurable statusline/tabline for Vim
    Plug 'itchyny/lightline.vim'

" }}}1

" Commands {{{1

    " commentary.vim: comment stuff out
    Plug 'tpope/vim-commentary'

    "Syntax checking hacks for Vim"
    Plug 'scrooloose/syntastic'

    "Provides insert mode auto-completion for quotes, parens, brackets, etc
    Plug 'Raimondi/delimitMate'

    "Vim script for text filtering and alignment
    Plug 'godlygeek/tabular'

    " This is an atomic save function for vim
    " Plug 'vim-scripts/Atomic-Save'

    " Delete buffers and close files in Vim without closing your windows or
    " messing up your layout
    Plug 'moll/vim-bbye'

    " abolish.vim: easily search for, substitute, and abbreviate multiple variants of a word
    " convert cases
    "crc to convert to fooBar
    " crm to convert to FooBar
    " cr_ or crs to convert to foo_bar
    " cru to convert to FOO_BAR
    " cr- to convert to foo-bar
    Plug 'tpope/vim-abolish'

" }}}1

" Text objects {{{1

    "quoting/parenthesizing made simple
    Plug 'tpope/vim-surround'

    "Vim plugin that provides additional text objects (pair, quote, separator)
    Plug 'wellle/targets.vim'

    " Vim plugin: Text objects for functions
    Plug 'kana/vim-textobj-user'

    " Vim plugin: Text objects for functions
    Plug 'kana/vim-textobj-function'

    " Text object for php functions
    Plug 'kentaro/vim-textobj-function-php'

    " Vim plugin: Text objects for the current line
    Plug 'kana/vim-textobj-line'

    " Vim plugin that defines a new text object representing lines of code at
    " the same indent level. Useful for python/vim scripts, etc
    Plug 'michaeljsmith/vim-indent-object'

    "Vim text objects for search matches
    Plug 'Raimondi/vim_search_objects'

    " Vim plugin that adds a new url text object
    Plug 'LeonB/vim-textobj-url'

" }}}1

" Libs {{{1

    "enable repeating supported plugin maps with \".\"
    Plug 'tpope/vim-repeat'

    " Repeat motions [for which a count was given]
    Plug 'Houl/repmo-vim'

    " Find out which project a file belongs to, easy to use in scripts/mappings
    Plug 'dbakker/vim-projectroot'

    " Vim plugin: Testing framework for Vim script
    " Plug 'kana/vim-vspec'

    " Interactive command execution in Vim.
    Plug 'Shougo/vimproc.vim', { 'do': 'make' }

    " Vim interface to Web API
    " Plug 'mattn/webapi-vim'

" }}}1

" Utilities {{{1

    " Vim plugin for Livedown
    " Plug 'shime/vim-livedown'

    " Make Vim handle line and column numbers in file names with a minimum of fuss
    Plug 'kopischke/vim-fetch'

" }}}1

" Config {{{1

    " EditorConfig plugin for Vim http://editorconfig.org
    " #slow-on-sshfs
    Plug 'editorconfig/editorconfig-vim'

" }}}
