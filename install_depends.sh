#!/bin/bash

set -ex

BUILD=_build

if [ ! -d .conan ]; then
    patch -p0 < conan.patch
fi
mkdir -p "$BUILD"
pushd "$BUILD"
conan install .. --build=missing
popd

if [ ! -d .venv ]; then
    python3 -m venv .venv
fi
. ./.venv/bin/activate
pip3 install -r requirements.txt
deactivate
rm -rf .cache
