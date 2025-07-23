provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "strapi" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name
  associate_public_ip_address = true

  root_block_device {
    volume_size = 20
  }

  user_data = base64encode(<<EOF
#!/bin/bash
yum update -y
yum install -y docker
systemctl enable docker
systemctl start docker
usermod -a -G docker ec2-user
newgrp docker

docker login -u ${var.docker_username} -p ${var.docker_password}
docker run -d \
  --name strapi-app \
  -p 1337:1337 \
  -e APP_KEYS="app_key1,app_key2,app_key3,app_key4" \
  -e API_TOKEN_SALT="Ubsn5To7CVuHcCi8QNz5Ag==" \
  -e ADMIN_JWT_SECRET="your_admin_jwt_secret" \
  -e JWT_SECRET="your_jwt_secret" \
  ${var.docker_username}/${var.image_tag}
EOF
  )

  tags = {
    Name  = "Strapi_EC2_CICD"
    Owner = "nagaraj"
  }
}

output "strapi_address" {
  value = "http://${aws_instance.strapi.public_ip}:1337/admin"
}
