variable "aws_region" {
  type    = string
  default = "us-east-2"
}

variable "ami" {
  type = string
default = "ami-0eb9d6fc9fab44d24"
}

variable "instance_type" {
  type    = string
  default = "t3.medium"
}

variable "key_name" {
  type = string
default="strapi_key_raja"
}

variable "image_tag" {
  description = "Docker image tag" #Will be passed by Github Actions
  type        = string
}


