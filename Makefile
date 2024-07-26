all:
	mkdir -p ~/data/wp-database
	mkdir -p ~/data/wp-files
	docker compose -f ./srcs/docker-compose.yml up --no-start
	docker compose -f ./srcs/docker-compose.yml start

start:
	docker compose -f ./srcs/docker-compose.yml start

stop:
	docker compose -f ./srcs/docker-compose.yml stop

up: all

down: stop
	docker compose -f ./srcs/docker-compose.yml down

build:
	mkdir -p ~/data/wp-database
	mkdir -p ~/data/wp-files
	docker compose -f ./srcs/docker-compose.yml build

clean: down
	docker volume rm -f inception_wp-files
	docker volume rm -f inception_wp-database
	sudo rm -rf ~/data/wp-files/*
	sudo rm -rf ~/data/wp-database/*

fclean: clean
	docker system prune -af
	docker volume prune -af

re: fclean all

.PHONY: all build up down start stop clean fclean rm
