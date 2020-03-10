#!/usr/bin/env bash
VERSION="latest"
TESTDIR=tests
docker run --rm \
           -v $PWD/atests:/$TESTDIR/ \
           -v $PWD/output:/outputs \
           robotframework-docker:$VERSION
