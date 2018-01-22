IMAGES = u-rabbitmq:
TAG = 0122
HOSTNAME = my-rabbit
CONTAINER = u-rabbit
.PHONY:all
all:
	@echo $$ make build
	@echo $$ make run
	@echo $$ make clean
	@echo $$ make logs
build:
	@sudo docker build -t $(IMAGES)$(TAG) .
run:
	@sudo docker run -d --hostname $(HOSTNAME) --name $(CONTAINER) $(IMAGES)$(TAG)
clean:
	@sudo docker rm -f $(CONTAINER)
logs:
	@sudo docker logs $(CONTAINER)
connect:
	@sudo docker exec -it $(CONTAINER) bash
