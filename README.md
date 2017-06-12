# Usage

Set webroot environment variable
```sh
export PHP_WEBROOT=/path/to/projects/files
```
# Development environment:
- nginx
- php-fpm (7.0 or 5.6) with xdebug and ioncube loader
- maildev
- mysql 5.7 with sql_mode=''

__PHP 5.6__

*Start containers*
```sh
docker-compose -f docker-compose.yml -f docker-compose.mail.development.yml -f docker-compose.php5.6.development.yml up -d
```
*Stop containers*
```sh
docker-compose -f docker-compose.yml -f docker-compose.mail.development.yml -f docker-compose.php5.6.development.yml down
```

__PHP 7.0__

*Start containers*
```sh
docker-compose -f docker-compose.yml -f docker-compose.mail.development.yml -f docker-compose.php7.0.development.yml up -d
```
*Stop containers*
```sh
docker-compose -f docker-compose.yml -f docker-compose.mail.development.yml -f docker-compose.php7.0.development.yml down
```

# Production environment:
- nginx
- php-fpm (7.0 or 5.6) with opcache and ioncube loader
- smtp service
    - postfix
    - opendkim
    - self signed ssl cert for mail encription
- mysql 5.7 with ```sql_mode=''```

__PHP 5.6__

*Start containers*
```sh
docker-compose -f docker-compose.yml -f docker-compose.mail.production.yml -f docker-compose.php5.6.production.yml up -d
```
*Stop containers*
```sh
docker-compose -f docker-compose.yml -f docker-compose.mail.production.yml -f docker-compose.php5.6.production.yml down
```

__PHP 7.0__

*Start containers*
```sh
docker-compose -f docker-compose.yml -f docker-compose.mail.production.yml -f docker-compose.php7.0.production.yml up -d
```
*Stop containers*
```sh
docker-compose -f docker-compose.yml -f docker-compose.mail.production.yml -f docker-compose.php7.0.production.yml down
```

# Connect to running docker container
```sh
docker exec -it "id of running container" sh
```