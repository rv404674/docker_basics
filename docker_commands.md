# DOCKER BASICS COMMANDS

## BASICS
1. docker version
will give detailed info about docker client and docker engine

2. docker -v
Will give docker version

3. docker info 
This will give all the info about docker running on your machine.
NOTE - this will give error if docker app is not running.

3. docker --help

4. docker images --help
will give info about 'docker images'

5. docker login
use this command to login to dockerhub, and pull  images.

## Images

1. docker images
will list all the images

2. docker pull
will pull any image from the docker hub

3. docker rmi image_name -f
will remove any image
-f is for force removal. you can give either image_name or image_id



## Containers

1. docker ps
will give the running containers

2. docker ps -a
will give all containers

3. docker run ubuntu
will run ubuntu image


3. docker run -it ubuntu
(will run ubuntu image in interactive mode - basically will attach a shell to it.
Check docker run --help for more)

4. docker stop container_id

5. docker start container_id

## SYSTEM

1. docker stats
memory/nw usage by running containers.

2. docker system df
show docker disk usage.

3. docker system prune
Remove unused data