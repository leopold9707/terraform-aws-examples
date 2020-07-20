variable "spec" {
  default = {
    Admin = {
      flavor = "t2.micro"
      root_volume_size = "10"
      additional_volume = "10"
    }
    K8s_Primary = {
      flavor = "t2.micro"
      root_volume_size = "10"
      additional_volume = "10"
    }
    K8s_Replica = {
      flavor = "t2.micro"
      root_volume_size = "10"
      additional_volume = "10"
    },
    DB = {
      flavor = "t2.micro"
      root_volume_size = "10"
      additional_volume = "20"
    }
  }
}

variable "hosts" {
  default = [
    "Admin",
    "K8s_Primary-01",
    "K8s_Primary-02",
    "K8s_Replica-01",
    "K8s_Replica-02",
    "DB-01",
    "DB-02"
  ]
}

variable "spec_of_hosts" {
  default = {
    Admin = {
      role   = "Admin"
      subnet = "public_subnet_1"
    }
    K8s_Primary-01 = {
      role   = "K8s_Primary"
      subnet = "public_subnet_1"
    }
    K8s_Primary-02 = {
      role   = "K8s_Primary"
      subnet = "public_subnet_2"
    }
    K8s_Replica-01 = {
      role   = "K8s_Replica"
      subnet = "public_subnet_1"
    }
    K8s_Replica-02 = {
      role   = "K8s_Replica"
      subnet = "public_subnet_2"
    }
    DB-01 = {
      role   = "DB"
      subnet = "private_subnet_1"
    }
    DB-02 = {
      role   = "DB"
      subnet = "private_subnet_2"
    }
  }
}

### AMI
variable "centos7" {
  type = string
  default = "ami-00014daafdc4239f4"
}

#### VPC PARAMS
variable "vpc_cidr_1" {
  default = "180.70.0.0/16"
}

/*variable "vpc_cidr_2" {
  default = "7.24.0.0/16"
}*/

#### SUBNET PARAMS
variable "subnets" {
  default = [
    "public_subnet_1",
    "public_subnet_2",
    "private_subnet_1",
    "private_subnet_2"
  ]
}

variable "subnet_info" {
  default = {
    public_subnet_1 = {
      cidr        = "180.70.251.0/24"
      availability_zone = "ap-northeast-2a"
    }
    private_subnet_1 = {
      cidr	= "180.70.1.0/24"
      availability_zone = "ap-northeast-2a"
    }
    public_subnet_2 = {
      cidr	= "180.70.252.0/24"
      availability_zone = "ap-northeast-2c"
    }
    private_subnet_2 = {
      cidr        = "180.70.2.0/24"
      availability_zone = "ap-northeast-2c"
    }
  }
}
