if [ -n "$BASH" ]; then
    for file in ~/.bashrc.d/bash_completion.d/*
    do
        if [ -f "$file" ]
        then
            source $file
        fi
    done

    for file in ~/.dotfiles/.linuxbrew/etc/bash_completion.d/*
    do
        if [ -f "$file" ]
        then
            source $file
        fi
    done
fi
