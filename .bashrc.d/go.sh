export GOPATH=$HOME/Workspaces/go
export PATH="$GOPATH/bin:$PATH"

export GOROOT="$HOME/bin/go1.8/"
export PATH="$GOROOT/bin:$PATH"

if program_exists go; then
    function setupGOROOT()
    {
        local GOPATH=`which go`
        local GODIR=`dirname $GOPATH`
        local GOPATH_BREW_RELATIVE=`readlink -m $GOPATH`
        local GOPATH_BREW=`dirname $GOPATH_BREW_RELATIVE`
        export GOROOT=`cd $GODIR; cd $GOPATH_BREW/../libexec; pwd`
    }
    # setupGOROOT
fi
