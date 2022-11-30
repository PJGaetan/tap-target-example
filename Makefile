ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

build:
	docker build --no-cache -t tap-target:latest .

run: 
	docker run \
		--volume="${ROOT_DIR}"/vol/:/opt/vol/ \
		tap-target >> ./state.json && \
		tail -n 1 state.json > vol/state.json # put last state for consumption


	
prune:
	docker container prune --force &&\
		docker image prune --force &&\
		docker volume rm vol
