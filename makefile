
.PHONY: all run clean debug

all: clean run

run:
	docker-compose up --build -d

debug: run
	docker-compose logs --follow

###### CLEANING #######

clean:
	docker-compose down --remove-orphans



