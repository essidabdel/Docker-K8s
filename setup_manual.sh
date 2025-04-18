#!/bin/bash

docker network create db_network
docker network create site_network
docker volume create db_volume

docker build -t mysql ./mysql
docker build -t app ./app

docker run -d \
  --name mysql_container \
  --network db_network \
  --network-alias mysql \
  -v db_volume:/var/lib/mysql \
  -p 5655:3306 \
  mysql

docker run -d \
  --name app_container \
  --network db_network \
  --network site_network \
  --network-alias app \
  -e DB_HOST=mysql \
  -e DB_USER=user \
  -e DB_PASSWORD=password \
  -e DB_NAME=testdb \
  app


docker run -d \
  --name nginx_container \
  --network site_network \
  -v $(pwd)/nginx/conf/default.conf:/etc/nginx/conf.d/default.conf \
  -p 5423:824 \
  nginx

# 
# docker stop mysql_container app_container nginx_container
# docker rm mysql_container app_container nginx_container
# docker network rm db_network site_network
# docker volume rm db_volume