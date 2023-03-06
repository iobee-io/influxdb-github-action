#!/bin/sh

VERSION=$1
PORTS=$2
CONTAINERNAME=$3
ORG=$4
USERNAME=$5
PASSWORD=$6
BUCKET=$7
ADMIN_TOKEN=$8

docker_run="docker run --detach --name $CONTAINERNAME -e DOCKER_INFLUXDB_INIT_MODE=setup"

for i in $(echo $PORTS | tr " " "\n")
do
  docker_run="$docker_run --publish $i"
done

if [ -n "$ORG" ]; then
  docker_run="$docker_run -e DOCKER_INFLUXDB_INIT_ORG=$ORG"
fi

if [ -n "$USERNAME" ]; then
  docker_run="$docker_run -e DOCKER_INFLUXDB_INIT_USERNAME=$USERNAME"
fi

if [ -n "$PASSWORD" ]; then
  docker_run="$docker_run -e DOCKER_INFLUXDB_INIT_PASSWORD=$PASSWORD"
fi

if [ -n "$BUCKET" ]; then
  docker_run="$docker_run -e DOCKER_INFLUXDB_INIT_BUCKET=$BUCKET"
fi

if [ -n "$ADMIN_TOKEN" ]; then
  docker_run="$docker_run -e DOCKER_INFLUXDB_INIT_ADMIN_TOKEN=$ADMIN_TOKEN"
fi

docker_run="$docker_run influxdb:$VERSION"

echo "$docker_run"
sh -c "$docker_run"
