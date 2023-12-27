#!/bin/bash
cd BookManager2 || exit
mvn package
cd ..

cd BookManagerVue || exit
npm install
npm run build:prod
cd ..

docker build -f Dockerfile.backend . -t backend
docker build -f Dockerfile.frontend . -t frontend
docker build -f Dockerfile.database . -t database
docker build -f Dockerfile.myredis . -t myredis

docker compose up -d

