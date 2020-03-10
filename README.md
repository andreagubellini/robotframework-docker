# robotframework-docker


## Dockerhub
You can find this image on dockerhub @ https://hub.docker.com/r/agubellini/robotframework-docker

## usage
inside `run-docker.sh` change:
```
HOST_TESTDIR= this is your local test directory. Example: HOST_TESTDIR=tests
ROBOTARGS = pass your robotframework arguments through this variable. Has to be included in docker run command.
THREADS= can be either 1 or 0. If set to 0 then all tests are executed with Robotframework, otherwise if set to 1 all tests will be executed with Pabot.
```
then:
`sh run-docker.sh`

## dependencies
currently available dependencies are:
```
robotframework
robotframework-seleniumlibrary
robotframework-requests
robotframework-pabot
```

## outputs
output files will be saved to host under `$PWD/output`

## Notes
This docker is able to run both Firefox and Chrome tests.

To let xvfb run, be sure your browser drivers have  `--no-sandbox` and `--disable-gpu` set