" Syntax / File types  / Indenting {{{1

    "Puppet niceties for your Vim setup
    " call dein#add('rodjek/vim-puppet')

    " Vim/Ruby Configuration File
    " call dein#add('vim-ruby/vim-ruby')

    "PHP-Correct-Indenting VIM script
    call dein#add('2072/PHP-Indenting-for-VIm')

    " Cutting-edge vim css syntax file
    call dein#add('JulesWang/css.vim')

    "Vim syntax file for scss (Sassy CSS)
    call dein#add('cakebaker/scss-syntax.vim')

    " Vastly improved Javascript indentation and syntax support in Vim.
    call dein#add("pangloss/vim-javascript")

    " CoffeeScript support for vim
    " call dein#add('kchmck/vim-coffee-script')

    "Vim Markdown runtime files
    call dein#add('tpope/vim-markdown')

    " jinja plugins for vim (syntax and indent)
    call dein#add('lepture/vim-jinja')

    " Add additional support for Ansible in VIM
    call dein#add('chase/vim-ansible-yaml')

    " nginx vim syntax
    call dein#add('chr4/nginx.vim')

    " Vim syntax highlighting for Blade templates.
    call dein#add('xsbeats/vim-blade')

    " Go development plugin for Vim
    call dein#add('fatih/vim-go')

    " mustache and handlebars mode for vim
    " call dein#add('mustache/vim-mustache-handlebars')

    " A better JSON for Vim
    " call dein#add('elzr/vim-json')

    " Twig syntax highlighting, snipMate, etc.
    call dein#add('qbbr/vim-twig')

" }}}1

" (Omni)completion {{{1

    " Improved PHP omnicompletion
    " call dein#add('shawncplus/phpcomplete.vim')

    " php manual doc
    call dein#add('drwX/php-manual.vim')

    " call dein#add('tobyS/pdv', {'depends' :)
    "             \ [
    "             \   'tobyS/vmustache',
    "             \   'SirVer/ultisnips',
    "             \ ]}

" }}}1

" Color schemes {{{1

    " Monokai colorschem
    call dein#add('sickill/vim-monokai')

    " Wombat for 256 color xterms
    call dein#add('vim-scripts/wombat256.vim')

    " Molokai color scheme for Vim
    call dein#add('tomasr/molokai')

    "Color theme Hemisu
    call dein#add('noahfrederick/Hemisu')

    "Color theme Bad Wolf
    call dein#add('sjl/badwolf')

    "precision colorscheme for the vim text editor
    call dein#add('altercation/vim-colors-solarized')

    " Dark, high contrast vim colorscheme
    call dein#add('MaxSt/FlatColor')

    " Dark, high contrast gvim colorscheme inspired by molokai and bad wolf.
    call dein#add('nielsmadan/harlequin')

    " precision colorscheme for the vim text editor
    call dein#add('altercation/vim-colors-solarized')

    " a low-contrast Vim color scheme based on Seoul Colors
    call dein#add('junegunn/seoul256.vim')

    " A GUI & 256 color port of the Railscasts Textmate theme to Vim
    call dein#add('dhruvasagar/vim-railscasts-theme')

    " Sexier version of Railscasts vim color scheme / theme
    call dein#add('oguzbilgic/sexy-railscasts-theme')

    " The original IR_Black color scheme for vim
    call dein#add('twerth/ir_black')

    " A colorful, dark color scheme for Vim
    call dein#add('nanotech/jellybeans.vim')

    " Gary Bernhardt's grb256 vim theme packaged to work with Pathogen/Vundle
    call dein#add('quanganhdo/grb256')

    " codeschool vim theme
    call dein#add('29decibel/codeschool-vim-theme')

    " Zenburn is a low-contrast color scheme for Vim
    call dein#add('jnurmine/Zenburn')

    " A fork of desert256.vim aims to make it a bit warm and more friendly for
    " my eyes.
    call dein#add('rainux/vim-desert-warm-256')

    " A slightly-modified desert theme, for 88- and 256-color xterms
    call dein#add('vim-scripts/desert256.vim')

    " summerfruit color scheme in 256 colors
    call dein#add('vim-scripts/summerfruit256.vim')

    " light color scheme
    call dein#add('therubymug/vim-pyte')

    " Color scheme for the Gnome2 "nuvola" theme
    call dein#add('vim-scripts/nuvola.vim')

    " A colorscheme and syntax for Vim
    call dein#add('itchyny/landscape.vim')

    " A dark theme for Atom, Alfred, Chrome DevTools, iTerm, Sublime Text,
    " Textmate, Terminal.app, Vim, Xcode, Zsh
    " look into on_source
    call dein#add('zenorocha/dracula-theme', {'rtp' : 'vim'})

    call dein#add('chriskempson/tomorrow-theme', {'rtp': 'vim'})

    " A vim colorscheme based on Github's syntax highlighting.
    call dein#add('endel/vim-github-colorscheme')

    " Dark-background GUI color scheme
    call dein#add('vim-scripts/Liquid-Carbon')

    " A slightly modified version of the original mustang-colorscheme for vim by hcalves.
    call dein#add('croaker/mustang-vim')

    " Spiritual successor to Skittles Dark
    call dein#add('shawncplus/skittles_berry')

    " Port of the Sunburst TextMate theme to Vim
    call dein#add('gigamo/sunburst.vim')

    " A(nother) port of TextMate's Twilight theme to Vim.
    call dein#add('matthewtodd/vim-twilight')


    " Dark gray color scheme sharing some similarities with Desert
    call dein#add('vim-scripts/Wombat')

    " Lucius color scheme for vim
    call dein#add('jonathanfilip/vim-lucius')

    " Vim color scheme
    call dein#add('zeis/vim-kolor')

    " Let's keep Vim warm
    call dein#add('nice/sweater')

    " Retro groove color scheme for Vim
    call dein#add('morhetz/gruvbox')

    " The colorscheme with neovim in mind
    call dein#add('freeo/vim-kalisi')

    call dein#add('geoffharcourt/one-dark.vim')

" }}}1

" Navigation {{{1

    " Powerful file explorer implemented by Vim script
    call dein#add('Shougo/vimfiler')

    " Unite and create user interfaces
    call dein#add('Shougo/unite.vim')

    " MRU plugin includes unite.vim MRU sources
    call dein#add('Shougo/neomru.vim')

    "extended % matching for HTML
    call dein#add('vim-scripts/matchit.zip')

    "Updates entries in a tags file automatically when saving
    " call dein#add('craigemery/vim-autotag')

    " Automated tag file generation and syntax highlighting of tags in Vim
    " #slow-on-sshfs
    " call dein#add('xolox/vim-easytags')
    " call dein#add('xolox/vim-misc')

    " Ctags generator for Vim (written in Vimscript)
    " call dein#add('szw/vim-tags')

    " Vim plugin that displays tags in a window, ordered by class etc.
    call dein#add('majutsushi/tagbar')

    " A 'jump to previous buffer' command that behaves as you would expect
    call dein#add('LeonB/vim-previous-buffer')

" }}}1

" GUI {{{1

    " Highlight colors in css files
    call dein#add('ap/vim-css-color')

    " A light and configurable statusline/tabline for Vim
    call dein#add('itchyny/lightline.vim')

" }}}1

" Commands {{{1

    " commentary.vim: comment stuff out
    call dein#add('tpope/vim-commentary')

    "Syntax checking hacks for Vim"
    call dein#add('scrooloose/syntastic')

    "Provides insert mode auto-completion for quotes, parens, brackets, etc
    call dein#add('Raimondi/delimitMate')

    "Vim script for text filtering and alignment
    call dein#add('godlygeek/tabular')

    " This is an atomic save function for vim
    " call dein#add('vim-scripts/Atomic-Save')

    " Delete buffers and close files in Vim without closing your windows or
    " messing up your layout
    call dein#add('moll/vim-bbye')

    " abolish.vim: easily search for, substitute, and abbreviate multiple variants of a word
    " convert cases
    "crc to convert to fooBar
    " crm to convert to FooBar
    " cr_ or crs to convert to foo_bar
    " cru to convert to FOO_BAR
    " cr- to convert to foo-bar
    call dein#add('tpope/vim-abolish')

" }}}1

" Text objects {{{1

    "quoting/parenthesizing made simple
    call dein#add('tpope/vim-surround')

    "Vim plugin that provides additional text objects (pair, quote, separator)
    call dein#add('wellle/targets.vim')

    " Vim plugin: Text objects for functions
    call dein#add('kana/vim-textobj-user')

    " Vim plugin: Text objects for functions
    call dein#add('kana/vim-textobj-function', {'depends': 'kana/vim-textobj-user'})

    " Text object for php functions
    call dein#add('kentaro/vim-textobj-function-php', {'depends': 'kana/vim-textobj-user'})

    " Vim plugin: Text objects for the current line
    call dein#add('kana/vim-textobj-line')

    " Vim plugin that defines a new text object representing lines of code at
    " the same indent level. Useful for python/vim scripts, etc
    call dein#add('michaeljsmith/vim-indent-object')

    "Vim text objects for search matches
    call dein#add('Raimondi/vim_search_objects')

    " Vim plugin that adds a new url text object
    call dein#add('LeonB/vim-textobj-url', {'depends': 'kana/vim-textobj-user'})

" }}}1

" Libs {{{1

    "enable repeating supported plugin maps with \".\"
    call dein#add('tpope/vim-repeat')

    " Repeat motions [for which a count was given]
    call dein#add('github.com/Houl/repmo-vim')

    " Find out which project a file belongs to, easy to use in scripts/mappings
    call dein#add('dbakker/vim-projectroot')

    " Vim plugin: Testing framework for Vim script
    " call dein#add('kana/vim-vspec')

    " Interactive command execution in Vim.
    call dein#add('Shougo/vimproc.vim', {'build': 'make'})

    " Vim interface to Web API
    " call dein#add('mattn/webapi-vim')

" }}}1

" Utilities {{{1

    " Vim plugin for Livedown
    " call dein#add('shime/vim-livedown')

    " Make Vim handle line and column numbers in file names with a minimum of fuss
    call dein#add('kopischke/vim-fetch')

" }}}1

" Config {{{1

    " EditorConfig plugin for Vim http://editorconfig.org
    " #slow-on-sshfs
    call dein#add('editorconfig/editorconfig-vim')

" }}}

