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

  user_data = templatefile("./strapi-deployment.sh", {
    image_tag = var.image_tag
  }

  tags = {
    Name  = "Strapi_EC2_CICD"
    Owner = "nagaraj"
  }
}
