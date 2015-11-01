# return # disable linuxbrew for now
# export PATH="$HOME/.dotfiles/.linuxbrew/bin:$PATH"
# # export LD_LIBRARY_PATH=`smart_append LD_LIBRARY_PATH /usr/lib`
# export LD_LIBRARY_PATH=`smart_append LD_LIBRARY_PATH $HOME/.linuxbrew/lib`
# export C_INCLUDE_PATH="$HOME/.linuxbrew/include"

if [ -d $HOME/.linuxbrew/ ];then
    LINUXBREW="$HOME/.dotfiles/.linuxbrew"
    export HOMEBREW_LOGS="$LINUXBREW/Logs"

    export PATH="$LINUXBREW/bin:$PATH"
    export C_INCLUDE_PATH="$LINUXBREW/include:$C_INCLUDE_PATH"
    export LIBRARY_PATH="$LINUXBREW/lib/:$LIBRARY_PATH"

    export MANPATH="$LINUXBREW/share/man:$MANPATH"
    export INFOPATH="$LINUXBREW/share/info:$INFOPATH"

    source `brew --repository`/Library/Contributions/brew_bash_completion.sh
fi
