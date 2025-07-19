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
