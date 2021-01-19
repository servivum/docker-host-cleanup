# 🧹 Docker Host Cleanup

Tool prunes images, containers, networks and volumes scheduled and keeps your Docker hosts clean. See 
[Docker Hub](https://hub.docker.com/r/servivum/docker-host-cleanup) for more details about it.

## Supported Tags

- `latest`, `20.10` [(Dockerfile)](https://github.com/servivum/docker-host-cleanup/blob/master/20.10/Dockerfile)
- `19.03` [(Dockerfile)](https://github.com/servivum/docker-host-cleanup/blob/master/19.03/Dockerfile)
- `18.09` [(Dockerfile)](https://github.com/servivum/docker-host-cleanup/blob/master/18.09/Dockerfile)
- `18.03` [(Dockerfile)](https://github.com/servivum/docker-host-cleanup/blob/master/18.03/Dockerfile)

**Note**: The images on [Docker Hub](https://hub.docker.com/r/servivum/docker-host-cleanup/tags) are automatically updated when a new version of Docker is released.

## Technologies

- Docker CLI
- Cron

## Dependencies

- Docker

## Usage

**Note**: Don't use tag `latest` in production. Choose tag corresponding to used Docker version you will get with `docker version`.

### Environment Variables

Control the cleanup behaviour with environment variables.

| **Name** | **Default**| **Example** | **Description** |
| --- | :---: | :---: | --- |
| `CRON_INTERVAL` | – | `0 3 * * *` | Set cron schedule |
| `PRUNE_BUILD_CACHES` | `false` | `true` | Remove **all** unused build caches |
| `PRUNE_BUILD_CACHES_FILTER` | - | `until=24h` | Remove filtered and unused build caches. |
| `PRUNE_CONTAINERS` | `false` | `true` | Remove **all** stopped containers |
| `PRUNE_CONTAINERS_FILTER` | - | `until=24h` | Remove filtered and stopped containers. See [Docker docs](https://docs.docker.com/engine/reference/commandline/container_prune/#filtering) for more examples. |
| `PRUNE_IMAGES` | `false` | `true` | Remove **all** unused images |
| `PRUNE_IMAGES_FILTER` | - | `until=24h` | Remove filtered and unused images. See [Docker docs](https://docs.docker.com/engine/reference/commandline/image_prune/#filtering) for more examples. |
| `PRUNE_NETWORKS` | `false` | `true` | Remove **all** unused networks. Networks will be removed after container cleanup. |
| `PRUNE_NETWORKS_FILTER` | - | `until=24h` | Remove filtered and unused networks. Networks will be removed after container cleanup. See [Docker docs](https://docs.docker.com/engine/reference/commandline/network_prune/#filtering) for more examples. |
| `PRUNE_VOLUMES` | `false` | `true` | ⚠️ **Remove all local volumes which are not referenced by any containers.** Networks will be removed after container cleanup. |

### Option 1: Run as a "Low-level" Container

```
docker container run \
    --volume /var/run/docker.sock:/var/run/docker.sock \
    --env CRON_INTERVAL="0 3 * * *" \
    --env PRUNE_IMAGES=true \
    servivum/docker-host-cleanup:latest
```

### Option 2: Run as a Service

```
docker service create \
    --name docker-host-cleanup \
    --mount type=bind,source=/var/run/docker.sock,destination=/var/run/docker.sock \
    --env CRON_INTERVAL="0 3 * * *" \
    --env PRUNE_IMAGES=true \
    servivum/docker-host-cleanup:latest
```

### Option 3: Deploy as a Stack

Adapt `docker-compose.production.yml` to your needs and deploy it with:

```
docker stack deploy -c docker-compose.production.yml docker-host-cleanup
```

## License

GNU General Public License v3.0