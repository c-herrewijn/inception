all:
	mkdir -p ~/data/wp-database
	mkdir -p ~/data/wp-files
	docker compose up

build:
	mkdir -p ~/data/wp-database
	mkdir -p ~/data/wp-files
	docker compose up --build

up: all

down:
	docker compose down

clean:
	docker compose down
	docker volume rm -f inception_wp-files
	docker volume rm -f inception_wp-database
	sudo rm -rf ~/data/wp-files/*
	sudo rm -rf ~/data/wp-database/*

fclean: clean
	docker system prune -af
	docker volume prune -af

re: fclean all

.PHONY: all build up down clean fclean rm
