
.PHONY: all run clean deepclean debug

all: clean run

###### CLEANING #######

clean:
	docker rm -f $$(docker ps -a -q)

deepclean: clean
	-sudo docker container prune -f
	-sudo docker image prune -f
	-sudo docker networks prune -f
	-sudo docker system prune -a -f --volumes

run:
	docker-compose up --build -d

debug: run
	docker-compose logs --tail=0 --follow
