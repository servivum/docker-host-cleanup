#!/bin/sh
set -e

echo "Running cleanup…"

if [ ! -z "$PRUNE_BUILD_CACHES_FILTER" ]
then
    echo "Removing filtered ($PRUNE_BUILD_CACHES_FILTER) build caches…"
    docker builder prune --all --filter $PRUNE_BUILD_CACHES_FILTER --force
elif [ "$PRUNE_BUILD_CACHES" = "true" ]
then
    echo "Removing all unused build caches…"
    docker builder prune --all --force
fi

if [ ! -z "$PRUNE_CONTAINERS_FILTER" ]
then
    echo "Removing filtered ($PRUNE_CONTAINERS_FILTER) containers…"
    docker container prune --filter $PRUNE_CONTAINERS_FILTER --force
elif [ "$PRUNE_CONTAINERS" = "true" ]
then
    echo "Removing all stopped containers…"
    docker container prune --force
fi

if [ ! -z "$PRUNE_IMAGES_FILTER" ]
then
    echo "Removing filtered ($PRUNE_IMAGES_FILTER) images…"
    docker image prune --all --filter $PRUNE_IMAGES_FILTER --force
elif [ "$PRUNE_IMAGES" = "true" ]
then
    echo "Removing all images…"
    docker image prune --all --force
fi

if [ ! -z "$PRUNE_NETWORKS_FILTER" ]
then
    echo "Removing filtered ($PRUNE_NETWORKS_FILTER) networks…"
    docker network prune --filter $PRUNE_NETWORKS_FILTER --force
elif [ "$PRUNE_NETWORKS" = "true" ]
then
    echo "Removing all unused networks…"
    docker network prune --force
fi

if [ "$PRUNE_VOLUMES" = "true" ]
then
    echo "Removing volumes…"
    docker volume prune --force
fi

echo "Cleanup done!"