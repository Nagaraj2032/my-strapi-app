variable "aws_region" {
  default = "us-east-2"
}

variable "ami" {
  # Amazon Linux 2 AMI for us-east-2
  default = "ami-0fb653ca2d3203ac1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "naga-key"  # 🔁 Replace with your existing EC2 key pair in us-east-2
}

variable "docker_image" {
  default = "nagaraj2032/strapi-app"  # 🔁 Replace with your Docker Hub image
}
