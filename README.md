# Usage

Set webroot environment variable
```sh
export PHP_WEBROOT=/path/to/projects/files
```

Set PROJECT_NAME environment variable
```sh
export PROJECT_NAME=my_project_name
```

# Development environment:
- nginx
- php-fpm (7.0 or 5.6) with xdebug and ioncube loader
- maildev
- mysql 5.7 with sql_mode=''

__PHP 5.6__

*Start containers*
```sh
docker-compose --project-name=$PROJECT_NAME -f docker-compose.yml -f docker-compose.mail.development.yml -f docker-compose.php5.6.development.yml up -d
```
*Stop containers*
```sh
docker-compose --project-name=$PROJECT_NAME -f docker-compose.yml -f docker-compose.mail.development.yml -f docker-compose.php5.6.development.yml down
```

__PHP 7.0__

*Start containers*
```sh
docker-compose --project-name=$PROJECT_NAME -f docker-compose.yml -f docker-compose.mail.development.yml -f docker-compose.php7.0.development.yml up -d
```
*Stop containers*
```sh
docker-compose --project-name=$PROJECT_NAME -f docker-compose.yml -f docker-compose.mail.development.yml -f docker-compose.php7.0.development.yml down
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
docker-compose --project-name=$PROJECT_NAME -f docker-compose.yml -f docker-compose.mail.production.yml -f docker-compose.php5.6.production.yml up -d
```
*Stop containers*
```sh
docker-compose --project-name=$PROJECT_NAME -f docker-compose.yml -f docker-compose.mail.production.yml -f docker-compose.php5.6.production.yml down
```

__PHP 7.0__

*Start containers*
```sh
docker-compose --project-name=$PROJECT_NAME -f docker-compose.yml -f docker-compose.mail.production.yml -f docker-compose.php7.0.production.yml up -d
```
*Stop containers*
```sh
docker-compose --project-name=$PROJECT_NAME -f docker-compose.yml -f docker-compose.mail.production.yml -f docker-compose.php7.0.production.yml down
```

# Connect to running docker container
```sh
docker exec -it "id of running container" sh
```

# PHP app execution

__Run command__

```sh
docker run -it --rm --volume 'path/to/app:/app' ${PROJECT_NAME}_php-cli /bin/sh -c "cd app && php ./my-app.php"
```

__Examples__

*Composer install*

```sh
docker run -it --rm --volume 'path/to/app:/app' ${PROJECT_NAME}_php-cli /bin/sh -c "cd /app && composer install"
```

*Cron manager execution*

```sh
docker run -it --rm --volume 'path/to/app:/app' ${PROJECT_NAME}_php-cli /bin/sh -c "cd /app && php -q public_html/index.php bff=cron-manager"
```

__ Alternatively__

*Run database migrations*
```sh
docker exec -it php-fpm sh -c "cd /path/to/app && ./vendor/bin/phinx migrate"
```