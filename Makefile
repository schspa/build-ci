
all:
	docker build --build-arg UID=$$(id -u) --build-arg GID=$$(id -g) --build-arg HOME=$${HOME} --build-arg UNAME=$${USER} -t j5-build:0.0.1 .


