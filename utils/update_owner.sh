source $(pwd)/.env

path_list=(
    config/site.php
    files
    public_html/files
    utils
)

echo "Set owner www-data:"
for f in $PHP_WEBROOT/*; do
    if [ -d "$f" ]; then
        project="$(basename "$f")"
        path=""
        for pl in ${path_list[*]}; do
            if [ -f $f/$pl ] || [ -d $f/$pl ]; then
                path="$project/$pl $path"
            fi
        done
        echo "      [EXECUTED] - Change owner from $project"
        docker exec -it php-fpm chown -R www-data:www-data /var/www/html/$path
    fi
done