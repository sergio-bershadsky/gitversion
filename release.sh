#!/usr/bin/env bash

DIR="$(pwd)"
VERSION="$(docker run --rm -v $DIR:/repository bershadsky/gitversion /showvariable SemVer | sed 's/[^-+_.a-zA-Z0-9]//g')"

git tag ${VERSION}
git push origin ${VERSION}