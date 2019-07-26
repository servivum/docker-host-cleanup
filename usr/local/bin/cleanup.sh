#!/bin/sh
set -e

echo "Running cleanup process…"

if [ "$PRUNE_ALL_IMAGES" = "true" ]
then
    echo "Removing all images, not just dangling ones…"
    docker image prune --all --force
elif [ "$PRUNE_IMAGES" = "true" ]
then
    echo "Removing unused images…"
    docker image prune --force
fi

if [ "$PRUNE_CONTAINERS" = "true" ]
then
    echo "Removing all stopped containers…"
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
    docker system prune --force
fi

echo "Cleanup process done!"