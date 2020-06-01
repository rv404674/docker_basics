# Jenkins on docker

1. 
```bash
docker pull jenkins
```

2. 
```bash
docker run -p 8080:8080 -p 50000:50000 jenkins
```

export port 8080 of host server(local machine), corresponds to 8080 port of jenkins running on docker.
similary for port 50000

**Usage** - this will start jenkins server and you will be able to access it using localhost:8080
**Cons** - once you kill/stop the container, all the jenkins data, plugins will also be deleted.

We want a persistent storage for jenkins home directory.

3.
```bash
docker run --name MyJenkins1 -p 8080:8080 -p 50000:50000 -v /Users/home/jenkins_home:/var/jenkins_home jenkins
```

Login using admin password and create a job.

**Usage** - Get persistent storage for jenkins home directory.
Will map jenkins dir to yours (on local machine). 
"jenkins_home" folder on the local host will be automatically created.

Visit [Jenkins](https://hub.docker.com/_/jenkins) to learn more.

admin password in "/Users/home/jenkins_home/secrets"

4.
```bash
docker rm MyJenkins1
```

```bash
docker run --name MyJenkins2 -p 9090:8080 -p 50000:50000 -v /Users/home/jenkins_home/:/var/jenkins_home jenkins
```

If you go to localhost:9090, you will see the previous created job as well.

**Advantage** - will be very handy when you want to share your data with multiple containers. (and we should always do this when we are working with enterprise projects.)


5.
```bash
docker volume create jenkinstemp
docker volume ls
```

**Usage** - will create a volume.

```bash
docker volume inspect jenkinstemp
```

"Mountpoint": "/var/lib/docker/volumes/jenkinstemp/_data"
(Mountpoint is where it is available)

Cons - although this volume is created on the host machine, you wont be able to change it.

**NOTE** - now instead of using a physical location, you can use this docker volume
```bash
docker run --name MyJenkins3 -p 9090:8080 -p 50000:50000 -v jenkinstemp:/var/jenkins_home jenkins
```

Becomes very easy when we want to share our data between multiple containers or persist data.

6. 
```
docker inspect MyJenkins3
```

you will find the location 
```json
        "Mounts": [
            {
                "Type": "volume",
                "Name": "jenkinstemp",
                "Source": "/var/lib/docker/volumes/jenkinstemp/_data",
                "Destination": "/var/jenkins_home",
                "Driver": "local",
                "Mode": "z",
                "RW": true,
                "Propagation": ""
            }
```
