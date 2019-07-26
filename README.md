# 🧹 Docker Host Cleanup

Tool prunes images, containers, networks and volumes scheduled and keeps your Docker hosts clean.

## Technologies

- Docker CLI
- Cron

## Dependencies

- Docker

## Usage

### 1. Container

⚠️ Notice: Don't use tag `latest` in production. Choose the tag corresponding to your server version you will find with `docker version`.

Run as "low-level" container:

```
docker container run \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --env CRON_INTERVAL="0 3 * * *" \
    --env PRUNE_IMAGES=true \
    --env RUN_ON_STARTUP=true \
    servivum/docker-host-cleanup:latest
```

### 2. Service

Run as service:

```
docker service create \
    --name srv-docker-host-cleanup \
    --mount type=bind,source=/var/run/docker.sock,destination=/var/run/docker.sock \
    --env CRON_INTERVAL="0 3 * * *" \
    --env PRUNE_IMAGES=true \
    --env RUN_ON_STARTUP=true \
    servivum/docker-host-cleanup:latest
```

### 3. Stack

Deploy with compose file.

Adapt `docker-compose.production.yml` to your needs and deploy it with:

```
docker stack deploy -c docker-compose.production.yml srv-docker-host-cleanup
```