UPDATE_OWNER=@sh ./utils/update_owner.sh
ENV_CLONE=@sh ./utils/envclone.sh
COMPOSE_PREFIX=docker-compose --project-name=$(PROJECT_NAME) -f docker-compose.yml
ALL_COMPOSE=docker-compose.php5.6.development.yml -f docker-compose.php5.6.production.yml -f docker-compose.mail.production.yml -f docker-compose.mail.development.yml -f docker-compose.php7.0.production.yml -f docker-compose.php7.0.development.yml

all:
exportenv:
	export $(cat .env)
build-dev-5.6: down
	$(COMPOSE_PREFIX) -f docker-compose.php5.6.development.yml -f docker-compose.mail.development.yml build
up-dev-5.6: down build-dev-5.6
	$(COMPOSE_PREFIX) -f docker-compose.php5.6.development.yml -f docker-compose.mail.development.yml up -d
	$(ENV_CLONE)
	$(UPDATE_OWNER)
build-dev-7.0: down 
	$(COMPOSE_PREFIX) -f docker-compose.php7.0.development.yml -f docker-compose.mail.development.yml build
up-dev-7.0: down build-dev-7.0
	$(COMPOSE_PREFIX) -f docker-compose.php7.0.development.yml -f docker-compose.mail.development.yml up -d
	$(UPDATE_OWNER)
build-prod-5.6: exportenv
	$(COMPOSE_PREFIX) -f docker-compose.php5.6.production.yml -f docker-compose.mail.production.yml build
up-prod-5.6: down build-prod-5.6
	$(COMPOSE_PREFIX) -f docker-compose.php5.6.production.yml -f docker-compose.mail.production.yml up -d
	$(UPDATE_OWNER)
build-prod-7.0: exportenv
	$(COMPOSE_PREFIX) -f docker-compose.php7.0.production.yml -f docker-compose.mail.production.yml build
up-prod-7.0: down build-prod-7.0
	$(COMPOSE_PREFIX) -f docker-compose.php7.0.production.yml -f docker-compose.mail.production.yml up -d
	$(UPDATE_OWNER)
down: exportenv
	$(COMPOSE_PREFIX) -f $(ALL_COMPOSE) down
init:
	sh ./utils/envinit.sh
	$(ENV_CLONE)