## DOCKER IMAGES

1. what are images
Templates used to create Docker containers. Container is a running instance of
an image

2. where are images stored
Registries ( e.g docker hub)

Dangling images - image that is not tagged and is not referenced by any Container.

**NOTE** - images are typically layers of file system stacked one on the other.

**NOTE** - you can create multiple docker containers from one image


## COMMANDS

```bash
docker pull ubuntu:18.04
```

```bash
docker images -q
```

```bash
docker images -f "dangling=false"
```
Will give all the images that are NOT dangling

```bash
docker run image_name
```

```bash
docker rmi -f image_name
```

```bash
docker inspect ubuntu (id)
```
will give all the detais of the image
