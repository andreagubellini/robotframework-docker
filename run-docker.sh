#!/usr/bin/env bash
VERSION="latest"
TESTDIR=tests
HOST_TESTDIR=atests
ARGS=--console-verbose
docker run --rm \
           -v $PWD/$HOST_TESTDIR:/$TESTDIR/ \
           -v $PWD/output:/outputs \
           -e ROBOTARGS=$ARGS \
           agubellini/robotframework-docker:$VERSION
