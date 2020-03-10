# robotframework-docker

# usage
## Dockerhub
You can find this image on dockerhub @ https://hub.docker.com/r/agubellini/robotframework-docker

## Local
inside `run-docker.sh` change:
```
HOST_TESTDIR=host test dir
```
then:
`sh run-docker.sh`

## outputs
output files will be saved to host under `$PWD/output`