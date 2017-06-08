location ~ \.php$ {
    try_files      $uri = 404;
    fastcgi_pass   php-fpm:9000;
    fastcgi_index  index.php;
    fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
    include        fastcgi_params;
    fastcgi_param  SERVER_NAME $realhost;
}