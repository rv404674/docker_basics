# DOCKER COMPOSE

## What is docker compose?
1. Tool for defining and running, multicontainer docker applications.
2. use yaml file to configure application services. (docker-compose.yml)
3. can start all the services with a single command, can stop all the services with
a single command.
4. can scale up selected services, as and when required.


1. 
```bash
docker-compose --version
```

```bash
docker-compose version
```

**Usage** - TO check if docker is installed or not.

2. Create a file name "docker-compose.yml".

3. 
Do ```bash docker-compose config -d```
to check the validity of the docker-compose file.

4. 
```bash docker-compose up -d```
**Usage** - Compose to create container and applications.

> Note (- -d, --detach) Detached mode: Run containers in the background, print new container names. **Pros** - so that you have the terminal for writing other commands.

To check the running containers do - ```docker ps``` now.

5.
Bring down application by command.

```bash docker-compose down```
**Usage** - Will stop everything.


# TIPS

1. How to scale some particular services.
```bash docker-compose -d --scale database=4```

**Usage** - will scale the database (i.e) redis service. This will work even if the 
containers are already running.

