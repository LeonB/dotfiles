" Replace:
" - padding:0; with padding: 0;
" - color:$c-white; with color: $c-white;
command! FixSpaceAfterPropertyColon %s/\([a-zA-Z0-9_\-]\+\):\([a-zA-Z0-9$]\)/\1: \2/
