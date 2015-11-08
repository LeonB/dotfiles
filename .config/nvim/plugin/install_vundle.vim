" Setting up Vundle - the vim plugin bundler
function! AutoInstallVundle()
    let iCanHazVundle=1
    let vundle_readme=expand('~/.config/nvim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.config/nvim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.config/nvim/bundle/vundle
        let iCanHazVundle=0
    endif
endfunction
