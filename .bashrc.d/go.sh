export GOPATH=$HOME/.go
export PATH="$GOPATH/bin:$PATH"
# export GOROOT="/usr/local/go"
# export GOROOT="$HOME/.linuxbrew/Cellar/go/1.6/libexec"

if program_exists go; then
    function setupGOROOT()
    {
        local GOPATH=`which go`
        local GODIR=`dirname $GOPATH`
        local GOPATH_BREW_RELATIVE=`readlink $GOPATH`
        local GOPATH_BREW=`dirname $GOPATH_BREW_RELATIVE`
        export GOROOT=`cd $GODIR; cd $GOPATH_BREW/../libexec; pwd`
    }
    setupGOROOT
fi
