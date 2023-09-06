
.PHONY: all build run clean debug

all: clean run

build:
	docker-compose build --no-cache

run:
	docker-compose up --build -d

debug: build run
	docker-compose logs --follow

###### CLEANING #######

clean:
	docker-compose down --remove-orphans



