if [ -d $HOME/.homebrew/ ]; then
    BREW_HOME="$HOME/.dotfiles/.homebrew"
elif [ -d $HOME/.linuxbrew/ ]; then
    BREW_HOME="$HOME/.dotfiles/.linuxbrew"
fi

if [ $BREW_HOME ]; then
    export HOMEBREW_LOGS="$BREW_HOME/Logs"

    export PATH="$BREW_HOME/bin:$PATH"
    export PATH="$BREW_HOME/sbin:$PATH"
    # Break rbenv install / ruby-build?
    export C_INCLUDE_PATH=`smart_prepend C_INCLUDE_PATH $BREW_HOME/include`
    export C_INCLUDE_PATH=`smart_prepend C_INCLUDE_PATH $BREW_HOME/include/libxml2`
    export LIBRARY_PATH=`smart_prepend LIBRARY_PATH $BREW_HOME/lib`
    export LD_LIBRARY_PATH=`smart_prepend LD_LIBRARY_PATH $BREW_HOME/lib`

    export MANPATH="$BREW_HOME/share/man:$MANPATH"
    export INFOPATH="$BREW_HOME/share/info:$INFOPATH"

    export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$BREW_HOME/opt/openssl"
fi
