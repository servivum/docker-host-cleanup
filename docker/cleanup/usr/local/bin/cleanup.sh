#!/bin/sh

echo "Running cleanup process…"

if [ "$PRUNE_IMAGES" = "true" ]
then
    echo "Cleaning images…"
    docker image prune --force
fi

if [ "$PRUNE_CONTAINERS" = "true" ]
then
    echo "Cleaning containers…"
    docker container prune --force
fi

if [ "$PRUNE_NETWORKS" = "true" ]
then
    echo "Cleaning networks…"
    docker network prune --force
fi

if [ "$PRUNE_VOLUMES" = "true" ]
then
    echo "Cleaning volumes…"
    docker volume prune --force
fi

if [ "$PRUNE_SYSTEM" = "true" ]
then
    echo "Cleaning system…"
    docker system prune --all --force
fi

echo "Cleanup process done"