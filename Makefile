include .env

default:
	make dev

recreate:
	docker-compose up -d --force-recreate

dev:
	docker-compose up -d 

logs:
	docker-compose logs

compose:
	docker-compose up

prod:
	make build
	docker-compose up -d
	make import

down:
	docker-compose down -v

stop:
	docker-compose stop

build:
	docker-compose build

in:
	docker exec -it ${WP_CONTAINER_NAME} bash

export:
	docker exec -it ${WP_CONTAINER_NAME} wp --allow-root db export /db/${file}.sql

import:
	make reset && docker exec -it ${WP_CONTAINER_NAME} wp --allow-root db import /db/${file}

reset:
	docker exec -it ${WP_CONTAINER_NAME} wp --allow-root db reset --yes

watch:
	cd src/themes/theme/ && yarn install && yarn start

localadmin:
	docker exec -it ${WP_CONTAINER_NAME} wp user create localadmin localadmin@localadmin.com --role=administrator --user_pass=123 --allow-root

del:
	docker exec -it ${WP_CONTAINER_NAME} wp user delete localadmin --yes --allow-root

replace-to-dev:
	docker exec -it ${WP_CONTAINER_NAME} wp --allow-root search-replace 'localhost' 'local.wordpress.com' --skip-columns=guid




