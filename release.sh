#!/usr/bin/env bash

DIR="$(pwd)"
VERSION=v"$(docker run -it -v $DIR:/repository bershadsky/getversion /showvariable SemVer | sed 's/[^-+_.a-zA-Z0-9]//g')"

git tag ${VERSION}
git push origin ${VERSION}