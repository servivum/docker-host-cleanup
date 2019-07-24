# Docker Host Cleanup

Tool prunes images, containers, networks and volumes scheduled and keeps your Docker hosts clean.

## Technologies

- Docker CLI
- Cron

## Dependencies

- Docker

## Usage

Adapt `docker-compose.production.yml` to your needs and deploy it with `docker stack deploy -c docker-compose.production.yml srv-docker-host-cleanup`