export GOPATH=$HOME/.go
export PATH="$GOPATH/bin:$PATH"
# export GOROOT="/usr/local/go"

# program_exists () {
#     type "$1" &> /dev/null ;
# }

# if program_exists go; then
#     function setupGOROOT()
#     {
#         local GOPATH=`which go`
#         local GODIR=`dirname $GOPATH`
#         local GOPATH_BREW_RELATIVE=`readlink $GOPATH`
#         local GOPATH_BREW=`dirname $GOPATH_BREW_RELATIVE`
#         export GOROOT=`cd $GODIR; cd $GOPATH_BREW/..; pwd`
#     }
#     setupGOROOT
# fi
