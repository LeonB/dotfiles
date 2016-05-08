AUTH_JSON=$HOME/.composer/auth.json
if [ -f "$AUTH_JSON" ]; then
    export COMPOSER_AUTH=$(cat "$AUTH_JSON")
fi
