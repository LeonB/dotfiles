#!/bin/bash

_remotefs()
{
    local cur prev words cword
    _init_completion -n : || return

    local configfile
    local -a config

    # Search COMP_WORDS for '-F configfile' or '-Fconfigfile' argument
    set -- "${words[@]}"
    while [[ $# -gt 0 ]]; do
        if [[ $1 == -F* ]]; then
            if [[ ${#1} -gt 2 ]]; then
                configfile="$(dequote "${1:2}")"
            else
                shift
                [[ $1 ]] && configfile="$(dequote "$1")"
            fi
            break
        fi
        shift
    done
    _known_hosts_real -a -F "$configfile" "$cur"
    if [[ $cword -ne 1 ]]; then
        compopt -o filenames
        COMPREPLY+=( $( compgen -c -- "$cur" ) )
    fi

    return 0
} &&
complete -F _remotefs remotefs uremotefs
