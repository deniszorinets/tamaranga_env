gzip on;
gzip_disable "msie6";
gzip_vary on;
gzip_proxied any;
gzip_comp_level 6;
gzip_buffers 16 8k;
gzip_http_version 1.1;
gzip_types text/plain application/javascript application/x­javascript text/javascript text/xml text/css;

location ~* ".+\.(?:ogg|ogv|svg|svgz|eot|otf|woff|mp4|ttf|rss|css|swf|js|atom|jpe?g|gif|png|ico|zip|tgz|gz|rar|bz2|doc|xls|exe|ppt|tar|mid|midi|wav|bmp|rtf)$" {
    access_log  off;
    log_not_found   off;
    expires     1w;
}