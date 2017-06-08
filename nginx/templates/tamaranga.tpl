client_header_timeout   300m;
client_body_timeout 300m;
client_max_body_size    64M;
send_timeout        300m;
fastcgi_read_timeout    300m;
fastcgi_buffers     16 16k;
fastcgi_buffer_size 32k;

location / {
    try_files $uri $uri/ @rewrites;
}
location @rewrites {
    rewrite ^ /index.php last;
}

# catch errors
error_page 401 /index.php?bff=errors&errno=401;
error_page 403 /index.php?bff=errors&errno=403;
error_page 404 /index.php?bff=errors&errno=404;
error_page 500 /index.php?bff=errors&errno=500;
error_page 501 /index.php?bff=errors&errno=501;
error_page 502 /index.php?bff=errors&errno=502;
error_page 504 /index.php?bff=errors&errno=504;