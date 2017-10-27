#!/bin/bash

# Run the docker cloud client first and point DOCKER_HOST to the suggested domain/ip

docker stack up --with-registry-auth -c docker-swarm.yml swarmtest_staging
