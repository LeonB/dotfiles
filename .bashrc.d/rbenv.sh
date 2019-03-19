export PATH="$HOME/.rbenv/shims:$PATH"

if [ -x "$(command -v rbenv)" ]; then
    eval "$(rbenv init --no-rehash -)"
    (rbenv rehash &) 2> /dev/null
fi
