#!/bin/bash

account=$1
version=$(cat VERSION)

docker tag sampledjangodockerswarm_backend ${account}'/swarmtest_backend:'${version}
docker tag sampledjangodockerswarm_frontend ${account}'/swarmtest_frontend:'${version}

docker push ${account}'/swarmtest_backend:'${version}
docker push ${account}'/swarmtest_frontend:'${version}
