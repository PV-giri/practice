variable "region" {}
variable "access_key" {}
variable "secret_key" {}
variable "ami" {}
variable "vpc_cidr" {}
variable "public_subnet" {
    type = list
    default = ["us-west-1a","us-west-1b"]
}

variable "public_cidr" {
    type = list
    default = ["192.168.1.0/24","192.168.2.0/24"]
}

