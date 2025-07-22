provider "aws" {
  region  = "us-east-2"
  profile = "devops"
}

resource "aws_key_pair" "strapi_key" {
  key_name   = "strapi_key_raj"
  public_key = file("~/.ssh/strapi_key_raj.pub")  # Ensure this file exists
}

resource "aws_instance" "strapi" {
  ami                         = "ami-0eb9d6fc9fab44d24"  # Amazon Linux 2023 for us-east-2
  instance_type               = "t3.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["sg-038861db81239cf2a"]  # Default security group
  subnet_id                   = "subnet-0c0bb5df2571165a9"  # Default subnet in us-east-2b
  key_name                    = aws_key_pair.strapi_key.key_name

  root_block_device {
    volume_size = 20
  }

  user_data = <<EOF
#!/bin/bash
yum update -y
curl -fsSL https://rpm.nodesource.com/setup_18.x | bash -
yum install -y nodejs
npm install -g yarn
git clone https://github.com/nagaraj2032/my-strapi-app.git
cd my-strapi-app
yarn install
yarn build
yarn start &
EOF

  tags = {
    Name  = "Strapi_Instance(raj)"
    Owner = "raj"
  }
}

output "strapi_address" {
  value = "http://${aws_instance.strapi.public_ip}:1337/admin"
}