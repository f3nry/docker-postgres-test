## General Docker

list containers -> `docker ps`
start container -> `docker run -t <template-name> -p <hostPort:containerPort>`
stop container -> docker stop <container-name>
statistics by container: docker stats
copy file from docker container to local file system: docker cp <container>:<target> <destination>
create an isolated user defined network: docker network create --driver bridge
isolated_nw

container links are deprecated in favor of user defined bridge links

## Starting

cd primary/ && docker build -t postgresql-primary . && docker run -p 5432:5432 --network isolated_nw --name primary -h primary -t postgres-primary
cd replica/ && docker build -t postgresql-replica . && docker run -p 5432:5432 --network isolated_nw --name replica -h replica -t postgres-replica

## Connecting

``
psql -h localhost -p 5432 -U docker # Primary
psql -h localhost -p 5433 -U docker # Replica
```

## TODO

- [] create docker-compose.json and use docker-compose up
- [] docker swarm?
- [] publish to github