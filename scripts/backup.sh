#!/bin/bash

DATE=$(date +%F)

mkdir -p /opt/backups/$DATE

docker ps > /opt/backups/$DATE/containers.txt

tar -czf /opt/backups/$DATE/docker-config.tar.gz /opt/docker