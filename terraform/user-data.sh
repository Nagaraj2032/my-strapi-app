#!/bin/bash
yum update -y
yum install docker -y
service docker start
usermod -a -G docker ec2-user
docker run -d \
  --name strapi-app \
  -p 1337:1337 \
  -e APP_KEYS="app_key1,app_key2,app_key3,app_key4" \
  -e API_TOKEN_SALT="Ubsn5To7CVuHcCi8QNz5Ag==" \
  -e ADMIN_JWT_SECRET="your_admin_jwt_secret" \
  -e JWT_SECRET="your_jwt_secret" \
  nagaraj2032/strapi-app:latest
