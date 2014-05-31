" When editing a git commit message (.git/COMMIT_EDITMSG) you often won't start
" on the first line due to Vim remembering your last position in that file.
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
