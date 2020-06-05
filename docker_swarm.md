<img style="float: right;" width="600" src="./assets/docker-swarm-nginx.png"> 

# What is docker swarm?

> swarm - is a group of machines that are running docker and joined into a cluster.

**Docker Swarm** is a tool for container orchestration.
> Orchestration - managing and controlling multiple docker containers as a single service

Let's suppose we have 100 containers. You need to do:
1. Health check on every container.
2. Ensure all containers are up on every system.
3. Can scale up and down the containers, depending on the load.
4. Adding updates/changed to all the containers.

**Tools Available** - Kubernetes, Docker swarm, Apache Mesos.

## Step 1.
1. Create docker machines to act as nodes for docker swarm.
Create one machine as manager and others as worker.

> **NOTE** - docker-machine, is not installed with latest docker desktop versions.
You need to install it separately, https://docs.docker.com/machine/install-machine/#install-machine-directly. Also you need to install virtualbox as well.

> Note - virtualbox is a OSS, that creates VM in which user can run other os.

```bash
docker-machine create --driver virtualbox manager1
docker-machine env manager1
```

> Note - following commands can be used to see the machines created through docker-machine
```bash
docker-machine ls
docker-machine ip manager1 # this will give ip of manager 1
```

Now create a worker as well.
```bash
docker-machine create --driver virtualbox worker1
docker-machine create --driver virtualbox worker2
```

## Step 2.
Connect to the docker machine (using ssh )

```bash
docker-machine ssh manager1
```

## Step 3
Initialize docker swarm.

```bash
# run this on manager machine. This will make this node a manager.
docker swarm init --advertise-addr MANAGER_IP

# run this on manager machine
docker node ls # will show who is manager and who is worker
```

## Step 4
Add workers to the swarm.

In manager node run the following commands
```bash
# this will give a command. Run it on any worker machine to make it a workre.
docker swarm join-token worker
```

## Step 4
On manager run standard docker commands.

```bash
# NOTE - now there will a swarm section as well.
docker info
```

## Step 5
Run containers on docker swarm

```bash
# run it on manager node
# NOTE - this will run 3 instances of nginx on three nodes (1 manager, 2 worker)
docker service create --replicas 3 -p 9090:80 --name web1 nginx
# to see the replicas
docker service ls
```

## Step 6
Scale service up and down.
On manager node.

> NOTE - if there are 3 nodes, and you have given web1=5, 4th and 5ht one can be randomly
created on anyone.

```bash
docker service scale web1=5

docker@manager1:~$ docker service ps web1
ID                  NAME                IMAGE               NODE                DESIRED STATE       CURRENT STATE           ERROR               PORTS
ati9mhoid0xp        web1.1              nginx:latest        worker1             Running             Running 6 minutes ago
t20x8sekgmw4        web1.2              nginx:latest        worker2             Running             Running 6 minutes ago
rpfx6heamxd0        web1.3              nginx:latest        manager1            Running             Running 6 minutes ago
1kno0i0knifq        web1.4              nginx:latest        worker1             Running             Running 2 minutes ago
jiollg0d0gz2        web1.5              nginx:latest        worker2             Running             Running 2 minutes ago
```

Now if you go into worker1.
and do

```bash
# will show the running containers on worker1
docker ps

CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
1a7fe72c7ab4        nginx:latest        "/docker-entrypoint.…"   4 minutes ago       Up 4 minutes        80/tcp              web1.4.1kno0i0knifqqewbi1r8b5x2n
8d75807e1b49        nginx:latest        "/docker-entrypoint.…"   8 minutes ago       Up 8 minutes        80/tcp              web1.1.ati9mhoid0xpnb4ns2hffrmzk

```

**Inspect Nodes** (this will run on manager node only)

```bash
docker node inspect worker1
# to inspect manager itself
docker node inspect self
```

## Step 6
Update your service running on multiple machines at once.

```bash
# till now we were using nginx:latest
docker service update --image nginx:1.14.0 web1
```

## Step 7
Shutdown node.
```bash
docker node update --availability drain worker1
```

## Step 8
Remove the service.
```bash
docker service rm web1
docker service ps web1
```

## Step 9
Leave the swarm
```bash
# if you run it on worker1, it will leave the swarm.
docker swarm leave
docker node ls (will run only on manager.)
```

## Step 10. TO stop the machine.
 > Note - run these commands from outside of any worker/manager machine
 ```bash
docker-machine stop worker1
```




