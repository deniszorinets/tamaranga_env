source $(pwd)/.env

echo "Clone .env file to projects:"
for f in $PHP_WEBROOT/*; do
    if [ -d "$f" ]; then
        project="$(basename "$f")"
        if [ -d $f/utils ]; then
            cp ./.env $f/utils
            echo "      [EXECUTED] - Clone .env from $project"
        else
            echo "      [FAILED] - Not dir 'utils' from $project"
        fi
    fi
done