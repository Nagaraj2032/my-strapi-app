#!/bin/bash
###########

# This will log the script output to both console and log file.
LOGFILE="/var/log/strapi-deployment.log"
exec > >(tee -a "$LOGFILE") 2>&1

echo "Script started at $(date)"

########################################

# Update the system and install Docker
echo "Installing Docker..."
yum update -y
yum install -y docker
systemctl enable docker
systemctl start docker

######################

# Remove any existing containers and networks to ensure a clean setup
echo "Cleaning up existing Docker containers and networks..."
docker rm -f strapi postgres
docker network rm strapi || true
docker volume rm postgres_data || true

# Create a Docker network for Strapi and Postgres to communicate
echo "Creating Docker network and volume..."
docker network create strapi
docker volume create postgres_data

# PostgreSQL Database Container Setup
echo "Starting PostgreSQL container..."
docker run -d --name postgres --network strapi -e POSTGRES_DB=strapi -e POSTGRES_USER=strapi -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD:-password} -v postgres_data:/var/lib/postgresql/data postgres:15

# Strapi Application Container Setup
echo "Starting Strapi container..."
docker run -d --name strapi --network strapi -p 1337:1337 \
  -e DATABASE_CLIENT=postgres \
  -e DATABASE_HOST=postgres \
  -e DATABASE_PORT=5432 \
  -e DATABASE_NAME=strapi \
  -e DATABASE_USERNAME=strapi \
  -e DATABASE_PASSWORD=${POSTGRES_PASSWORD:-password} \
  nagaraj2032/my-strapi-app:latest

# Check for Strapi container health (optional but useful for debugging)
echo "Checking Strapi container status..."
docker ps

echo "Strapi deployed successfully. Access it at http://$(hostname -I | awk '{print $1}'):1337/admin"
echo "Script completed at $(date)"
