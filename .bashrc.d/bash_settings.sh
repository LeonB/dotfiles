# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000
TERM=xterm-256color

# let * also match filenames beginning with a dot
shopt -s dotglob

# append to the history file, don't overwrite it
shopt -s histappend
