# return # disable linuxbrew for now
export PATH="$HOME/.linuxbrew/bin:$PATH"
export LD_LIBRARY_PATH=`smart_append LD_LIBRARY_PATH $HOME/.linuxbrew/.lib`
source `brew --repository`/Library/Contributions/brew_bash_completion.sh
