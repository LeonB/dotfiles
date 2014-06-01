# export allows variables to be passed to child processes
export MAKEFLAGS="-j$(grep -c "^processor" /proc/cpuinfo)"
