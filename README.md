# 🧹 Docker Host Cleanup

Tool prunes images, containers, networks and volumes scheduled and keeps your Docker hosts clean. See 
[Docker Hub](https://hub.docker.com/r/servivum/docker-host-cleanup) for more details about it.

## Supported Tags

- `latest`, `19.03` [(Dockerfile)](https://github.com/servivum/docker-host-cleanup/blob/master/Dockerfile)
- `18.09` [(Dockerfile)](https://github.com/servivum/docker-host-cleanup/blob/master/Dockerfile-18.09)
- `18.03` [(Dockerfile)](https://github.com/servivum/docker-host-cleanup/blob/master/Dockerfile-18.03)

⚠️ **Note**: The release of a Docker bugfix will automatically trigger a rebuild of the images on Docker Hub.

## Technologies

- Docker CLI
- Cron

## Dependencies

- Docker

## Usage

⚠️ **Note**: Don't use tag `latest` in production. Choose tag corresponding to used Docker version you will find with `docker version`.

### 1. Option: Run as "Low-level" Container

```
docker container run \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --env CRON_INTERVAL="0 3 * * *" \
    --env PRUNE_IMAGES=true \
    --env RUN_ON_STARTUP=true \
    servivum/docker-host-cleanup:latest
```

### 2. Option: Run as Service

```
docker service create \
    --name srv-docker-host-cleanup \
    --mount type=bind,source=/var/run/docker.sock,destination=/var/run/docker.sock \
    --env CRON_INTERVAL="0 3 * * *" \
    --env PRUNE_IMAGES=true \
    --env RUN_ON_STARTUP=true \
    servivum/docker-host-cleanup:latest
```

### 3. Option: Deploy as Stack

Adapt `docker-compose.production.yml` to your needs and deploy it with:

```
docker stack deploy -c docker-compose.production.yml srv-docker-host-cleanup
```

## License

GNU General Public License v3.0