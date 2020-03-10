#!/usr/bin/env bash
VERSION="latest"
TESTDIR=tests
HOST_TESTDIR=atests
docker run --rm \
           -v $PWD/$HOST_TESTDIR:/$TESTDIR/ \
           -v $PWD/output:/outputs \
           agubellini/robotframework-docker:$VERSION
