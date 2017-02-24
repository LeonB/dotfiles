AUTH_JSON=$HOME/.config/composer/auth.json
if [ -f "$AUTH_JSON" ]; then
    export COMPOSER_AUTH=$(cat "$AUTH_JSON")
fi
