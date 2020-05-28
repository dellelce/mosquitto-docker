# Mosquitto Makefile

# Configuration
IMG := dellelce/mosquitto
MOSQUITTOVER = $$(docker run -it --rm $(IMG) mosquitto -h| sed -e 's/\r/\n/' | awk 'FNR == 1 { print $$3 } ')

help:
	@echo Always use "help" as default

all: build
build: mosquitto

.PHONY: mosquitto
mosquitto:
	@docker build -t $(IMG) . && docker tag $(IMG):latest $(IMG):$(MOSQUITTOVER)

mqshell: mosquitto
	@docker run -it --rm $(IMG) sh

push: mosquitto
	@docker push $(IMG)

clean:
	@docker rmi $(IMG)

allcycle: all clean
