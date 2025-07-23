#!/bin/bash
###########
 
#This will log the script output.
LOGFILE="/var/log/strapi-deployment.log"
exec > >(tee -a "$LOGFILE") 2>&1
 
echo "Script started at $(date)"
 
########################################
 
#These commands will install and start docker.
yum update -y
yum install -y docker
systemctl enable docker
systemctl start docker
 
######################
 
#These commands will deploy the complete strapi setup.
docker network create strapi
docker volume create postgres_data
 
#PostgresDB
docker run -d --name postgres --network strapi -e POSTGRES_DB=strapi -e POSTGRES_USER=strapi -e POSTGRES_PASSWORD=password -v postgres_data:/var/lib/postgresql/data postgres:15
 
#Strapi
docker run -d --name strapi --network strapi -p 1337:1337 -e DATABASE_CLIENT=postgres -e DATABASE_HOST=postgres -e DATABASE_PORT=5432 -e DATABASE_NAME=strapi -e DATABASE_USERNAME=strapi -e DATABASE_PASSWORD=password  nagaraj2032/strapi-app:${var.image_tag}