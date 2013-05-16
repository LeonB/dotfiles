:"This is intersting: https://dev.launchpad.net/UltimateVimPythonSetup

setlocal tabstop=8 "when backspacing, when you encounter 4 spaces (tab) remove them as one
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab
setlocal smartindent
setlocal fileformat=unix

"let ropevim_vim_completion=1 "let rope use vim completion
"let ropevim_extended_complete=0

"vim-gnome + python-rope nodig!
"source /home/leon/.local/ropevim.vim
"source /home/leon/src/vim/vim.hg/rope.vim
"source /home/leon/.local/lib/python2.7/site-packages/ropevim-0.3_rc-py2.7.egg/ropevim.vim

"on <esc> remove the menu and don't show it again
"inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"

noremap <C-]> :call RopeGotoDefinition()<cr>
