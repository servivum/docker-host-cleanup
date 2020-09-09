#!/bin/sh
set -e

echo "Running cleanup process…"

if [ "$PRUNE_BUILD_CACHES" = "true" ]
then
    echo "Removing all unused build caches…"
    docker builder prune --force
fi

if [ "$PRUNE_CONTAINERS" = "true" ]
then
    echo "Removing all stopped containers…"
    docker container prune --force
fi

if [ "$PRUNE_IMAGES_ALL" = "true" ]
then
    echo "Removing all unused images…"
    docker image prune --all --force
elif [ "$PRUNE_IMAGES" = "true" ]
then
    echo "Removing dangling images…"
    docker image prune --force
fi

if [ "$PRUNE_NETWORKS" = "true" ]
then
    echo "Removing all unused networks…"
    docker network prune --force
fi

if [ "$PRUNE_SYSTEM" = "true" ]
then
    echo "Removing unused containers, networks, and dangling images…"
    docker system prune --force
fi

if [ "$PRUNE_VOLUMES" = "true" ]
then
    echo "Cleaning volumes…"
    docker volume prune --force
fi

echo "Cleanup process done!"