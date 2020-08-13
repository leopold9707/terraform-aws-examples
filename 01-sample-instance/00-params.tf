# parms file for aws ec2 cloud

#### VPC Network
variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

#### NETWORK PARAMS
variable "network_http" {
  default = {
    subnet_name = "terraform-cloud"
    cidr        = "192.168.1.0/24"
  }
}

