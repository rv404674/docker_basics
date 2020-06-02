## Stable vs Edge Version
Edge provides an installer with new features, but it is not necessarily fully tested. Edge is sort of the beta one.

## What is Docker app (docker.app)
Docker.app is the Docker Desktop on Mac. It bundles the Docker client and Docker Desktop. It uses the macOS Hypervisor.framework to run containers, which means that a separate VirtualBox is not required to run Docker Desktop.

## Memory Limit
It is very important to not allow a running container to consume too much memory 
of the host machine memory.

**Linux**
On linux, if the kernel detects that there is not enough memory to perform important system functions, it throws an **Out of Memory Exception**, and start killing processes
to free memory. (on linux docker containers runs directly on kernel level)

**MAC**
Memory - By default, docker desktop is set to use **2GB** runtime memory, allocated from
the total available memory on your Mac.  To increase the RAM, set this to a higher number. To decrease it, lower the number

CPU - By default, docker desktop is set to use half the number of processors available on the host machine.