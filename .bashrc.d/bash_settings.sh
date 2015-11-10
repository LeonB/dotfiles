# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=20000

# Create history file per year/month
# HISTFILE="${HOME}/.history/$(date -u +%Y/%m/%d.%H.%M.%S)_$(hostname)_$$"
# mkdir -p $(dirname "$HISTFILE")

TERM=xterm-256color

# let * also match filenames beginning with a dot
shopt -s dotglob

# append to the history file, don't overwrite it
shopt -s histappend
