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
  default = "naga-key"  # 🔁 Replace with your existing EC2 key pair
}

variable "docker_username" {
  description = "Docker Hub username"
  type        = string
}

variable "docker_password" {
  description = "Docker Hub password"
  type        = string
}

variable "image_tag" {
  description = "Docker image tag for the Strapi app"
  type        = string
}
