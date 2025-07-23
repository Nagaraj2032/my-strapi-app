user_data = <<-EOF
#!/bin/bash
yum update -y
yum install -y docker
systemctl enable docker
systemctl start docker
usermod -a -G docker ec2-user
newgrp docker

# Docker Hub login
docker login -u "${var.docker_username}" -p "${var.docker_password}"

# Pull the image with tag
docker pull ${var.docker_username}/${var.image_name}:${var.image_tag}

# Run the container
docker run -d \
  --name strapi-app \
  -p 1337:1337 \
  -e APP_KEYS="app_key1,app_key2,app_key3,app_key4" \
  -e API_TOKEN_SALT="Ubsn5To7CVuHcCi8QNz5Ag==" \
  -e ADMIN_JWT_SECRET="your_admin_jwt_secret" \
  -e JWT_SECRET="your_jwt_secret" \
  ${var.docker_username}/${var.image_name}:${var.image_tag}
EOF