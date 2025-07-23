variable "aws_region" {
  type    = string
  default = "us-east-2"
}

variable "ami" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "key_name" {
  type = string
}

# Docker Hub credentials
variable "docker_username" {
  type = string
}

variable "docker_password" {
  type      = string
  sensitive = true
}

# Image name & tag
variable "image_name" {
  type    = string
  default = "strapi-app"
}

variable "image_tag" {
  description = "Tag of the Docker image to deploy (e.g., latest or CI SHA)"
  type        = string
  default     = "latest"
}

# App secrets
variable "app_keys" {
  type    = string
  default = "app_key1,app_key2,app_key3,app_key4"
}

variable "api_token_salt" {
  type    = string
  default = "Ubsn5To7CVuHcCi8QNz5Ag=="
}

variable "admin_jwt_secret" {
  type    = string
  default = "your_admin_jwt_secret"
}

variable "jwt_secret" {
  type    = string
  default = "your_jwt_secret"
}