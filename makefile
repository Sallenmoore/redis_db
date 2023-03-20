
.PHONY: all run clean deepclean debug

all: clean run

create-network:
	if [ -z $$(docker network ls --filter name=app_net -q | grep app_net) ]; then \
		docker network create app_net; \
	fi

run: create-network
	docker-compose up --build -d

debug: create-network run
	docker-compose logs --tail=0 --follow

###### CLEANING #######

clean:
	docker rm -f $$(docker ps -a -q)

deepclean: clean
	-sudo docker container prune -f
	-sudo docker image prune -f
	-sudo docker networks prune -f
	-sudo docker system prune -a -f --volumes


