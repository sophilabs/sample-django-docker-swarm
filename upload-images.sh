#!/bin/bash

account=$1
version=$(cat VERSION)

docker tag swarmtest_backend ${account}'/swarmtest_backend:'${version}
docker tag swarmtest_frontend ${account}'/swarmtest_frontend:'${version}

docker push ${account}'/swarmtest_backend:'${version}
docker push ${account}'/swarmtest_frontend:'${version}
