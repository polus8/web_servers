variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "eu-central-1"
}

variable "AWS_ZONE1" {
  default = "eu-central-1a"
}

variable "AWS_ZONE2" {
  default = "eu-central-1b"
}

variable "AWS_ZONE3" {
  default = "eu-central-1c"
}

variable "AMIS" {
  type = map(string)
  default = {
    eu-central-1 = "ami-0cc0a36f626a4fdf5"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}