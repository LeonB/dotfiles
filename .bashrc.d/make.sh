# export allows variables to be passed to child processes
if [ -f /proc/cpuinfo ]; then
    export MAKEFLAGS="-j$(grep -c "^processor" /proc/cpuinfo)"
fi

if [ -x "$(command -v sysctl)" ]; then
    export MAKEFLAGS="-j$(sysctl -n hw.ncpu)"
fi
