#!/bin/sh

export tag="latest"
if [ "$TRAVIS_TAG" ]; then
    export tag=$TRAVIS_TAG
fi
echo "tag=$tag"

echo "run unit tests..."
docker run --rm -e tag=$tag -v $HOME/dot_build_cache/dot_m2:/root/.m2 -v $(pwd):/root -w /root maven:3.5.2-jdk-8-alpine mvn test

echo "build uber jar..."
docker run --rm -e tag=$tag -v $HOME/dot_build_cache/dot_m2:/root/.m2 -v $(pwd):/root -w /root maven:3.5.2-jdk-8-alpine mvn package

echo "build jre docker image with uber jar..."
docker build --build-arg tag=$tag -t yglcode/travis-java:$tag .





