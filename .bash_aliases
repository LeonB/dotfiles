#alias make="make -j `distcc -j` CC=distcc"
alias tmux="tmux -2"
#alias screen="tmux"
#alias rm="gvfs-trash"
alias term="gnome-terminal"
alias open="xdg-open"
# alias emacs='emacs -nw'
alias emacs='emacsclient -c -t'
# alias emacsclient='emacsclient -t'
# alias ack='ack-grep'
alias realpath="readlink -f"
alias sup="RBENV_VERSION=2.0.0-p451 sup"
alias ap="ansible-playbook"
alias art="php artisan"
alias artisan="php artisan"
alias phpstorm="$HOME/bin/phpstorm/bin/phpstorm.sh"
alias git-root='cd $(git rev-parse --show-toplevel)'
alias pwgen='/usr/bin/pwgen --capitalize --secure --symbols 22'
alias bean='sudo $HOME/.local/bin/bean'
alias vim='nvim'
alias nvim='nvim.appimage'
# alias rtv='LC_ALL=C.UTF-8 LANG=C.UTF-8 rtv-lbo.rtv'
alias fritzing="QT_AUTO_SCREEN_SCALE_FACTOR=0.75 $HOME/bin/fritzing-0.9.3b.linux.AMD64/Fritzing"
alias postman="$HOME/bin/Postman/Postman"
alias slic3r='Slic3r-1.3.1-dev-880e9a5-x86_64.AppImage'
alias cura='Cura-3.6.0.AppImage'
# alias slic3rpe='Slic3rPE-1.41.0+linux64-full-201809010758.AppImage'
alias slic3rpe-stable='Slic3rPE-1.41.2+linux64-full-201811221508.AppImage'
alias slic3rpe='XLIB_SKIP_ARGB_VISUALS=1 Slic3rPE-1.42.0-beta+linux64-full-201903171406.AppImage'
alias openscad="$HOME/bin/OpenSCAD-Release-0-Build36.20.glibc2.14-x86_64.AppImage"
alias freecad0.17="$HOME/bin/FreeCAD-0.17.13541.9948ee4.glibc2.17-x86_64.AppImage"
alias freecad0.18="$HOME/bin/FreeCAD_0.18.15900_Conda_Py3Qt5_glibc2.12-x86_64.AppImage"
alias freecad="freecad0.17"
