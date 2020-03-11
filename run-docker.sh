#!/usr/bin/env bash
VERSION="latest"
TESTDIR=tests/
SUBTESTDIR=mobile_tests
HOST_TESTDIR=atests/
ARGS="--console-verbose"
THREADS="0"
docker run --rm \
           -v $PWD/$HOST_TESTDIR:/$TESTDIR/ \
           -v $PWD/output:/outputs \
           -e ROBOTARGS=$ARGS \
           -e THREADS=$THREADS \
           -e TESTDIR=$TESTDIR \
           -e SUBTESTDIR=$SUBTESTDIR \
           agubellini/robotframework-docker:$VERSION