# DOCKER FILE

<img style="float: right;" width="600" src="./assets/docker_file.png"> 

docker_file = is a simple text file with instructions to build a image

1. Create a file name **Dockerfile**

2. Add instructions to docker file.
(RUN gets executed when building image from dockerfile and CMD gets executed when 
you create a container from a image )

3. Build dockerfile to create image
**NOTE**
docker build . (if the docker file is present in the current location, else you need to give the full location)

```bash
docker build -t myimage1:1.0 .
```
**Usage** - docker build will create a image from dockerfile. Give image name with tag.

4. run image to create container
```bash
docker run image_id
```

will output "Hello World! from my first docker images"