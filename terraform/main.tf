provider "aws" {
  region = var.aws_region
}
resource "aws_security_group" "strapi_sg" {

  name        = "strapi-sg-raj"

  description = "Allows SSH and Strapi Access"
 
  ingress {

    from_port   = 1337

    to_port     = 1337

    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port   = 22

    to_port     = 22

    protocol    = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    from_port   = 0

    to_port     = 0

    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }
 
  tags = {

    Name  = "Strapi_Instance(raj)"

    Owner = "nagaraj"

  }

}
 

resource "aws_instance" "strapi" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids      = [aws_security_group.strapi_sg.id]
  key_name               = var.key_name
  associate_public_ip_address = true

  root_block_device {
    volume_size = 20
  }

  user_data = base64encode(<<EOF
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

docker run -d --name strapi --network strapi -p 1337:1337 -e DATABASE_CLIENT=postgres -e DATABASE_HOST=postgres -e DATABASE_PORT=5432 -e DATABASE_NAME=strapi -e DATABASE_USERNAME=strapi -e DATABASE_PASSWORD=password  nagaraj2032/strapi-app:${image_tag}
 

EOF
  )

  tags = {
    Name  = "Strapi_EC2_CICD"
    Owner = "nagaraj"
  }
}
