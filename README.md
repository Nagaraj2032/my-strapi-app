<<<<<<< HEAD
## Internship Task Progress

### ✅ Task 1: Run Strapi Locally and Create Content Type
- Cloned the official Strapi GitHub repository
- Installed dependencies and ran the app locally
- Created a sample content type using the admin dashboard
- Explored project folder structure
- Pushed setup to GitHub

### ✅ Task 2: Dockerize Strapi with PostgreSQL
- Added Dockerfile for Strapi application
- Created docker-compose.yml with PostgreSQL service
- Configured `.env` file for database credentials
- Verified local container startup with persistent database
- Exposed Strapi Admin on port 1337

### ✅ Task 3: Add Nginx Reverse Proxy
- Added `nginx.conf` for reverse proxy
- Configured Nginx to expose Strapi Admin on port 80
- Updated docker-compose.yml to include Nginx
- Ensured all services run on the same Docker network
- Verified app is accessible at `http://localhost`

✅ Task 4: Deploy Strapi on EC2 using Terraform and Docker
Created a new Terraform project folder with infrastructure code

Wrote Terraform configuration to provision an EC2 instance on AWS

Configured EC2 security group to allow HTTP (port 80) and SSH (port 22)

Created user_data.sh to automate Docker installation and Strapi container startup

Built and pushed custom Strapi Docker image to Docker Hub: nagaraj2032/strapi-app:latest

Updated Terraform user_data to pull Docker image and run the container exposing port 1337

Verified EC2 instance boots up and runs Strapi automatically

Accessed Strapi Admin Panel via EC2 Public IP: http://<EC2_PUBLIC_IP>:1337



