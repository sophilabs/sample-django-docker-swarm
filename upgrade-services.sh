#!/bin/bash

account=$1
service=$2
version=$(cat VERSION)

# Run the docker cloud client first and point DOCKER_HOST to the suggested domain/ip

docker service update --image ${account}'/swarmtest_'${service}':'${version} 'swarmtest_staging_'${service}