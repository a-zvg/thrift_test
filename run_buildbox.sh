#!/bin/bash

set -ex

docker run -it --rm -h buildbox -v $PWD:/home/user/ buildbox:conan bash
