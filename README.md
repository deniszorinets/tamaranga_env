# Usage

Set webroot environment variable
```sh
export PHP_WEBROOT=/path/to/projects/files
```

Start containers
```sh
docker-compose -f docker-compose.yml -f docker-compose.development.yml up
```
Start containers demonized
```sh
docker-compose  -f docker-compose.yml -f docker-compose.development.yml up -d
```
Stop containers
```sh
docker-compose  -f docker-compose.yml -f docker-compose.development.yml down
```
Connect to running docker container
```sh
docker exec -it "id of running container" sh
```