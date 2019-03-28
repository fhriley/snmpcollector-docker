#!/bin/bash

set -x

COMMIT=`curl --silent https://github.com/toni-moreno/snmpcollector |grep -A1 commit-tease-sha | grep -v '<' |awk -F ' ' '{print $1}'`
VERSION=`curl -L --silent https://github.com/toni-moreno/snmpcollector/raw/master/package.json | grep version | awk -F':' '{print $2}'| tr -d "\", "`

docker build --no-cache --label commit="$COMMIT" -t hyber/snmpcollector:latest -t hyber/snmpcollector:$VERSION .
