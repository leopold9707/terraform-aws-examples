### define role and its spec
variable "spec" {
  default = {
### role: Admin, spec: flavor / root_disk / attached_volume
    Admin = {
      flavor = "t2.2xlarge"
      root_volume_size = "160"
      additional_volume = "100"
    }
### role: K8s_Primary, spec: flavor / root_disk / attached_volume
    K8s_Primary = {
      flavor = "t2.2xlarge"
      root_volume_size = "160"
      additional_volume = "100"
    }
### role: K8s_Replica, spec: flavor / root_disk / attached_volume
    K8s_Replica = {
      flavor = "t2.2xlarge"
      root_volume_size = "160"
      additional_volume = "100"
    }
  }
}

### define host name
variable "hosts" {
  default = [
### VMs in VPC-1
    "1-Primary-01",
    "1-Primary-02",
    "1-Primary-03",
    "1-Replica-01",
    "1-Replica-02",
### VMs in VPC-2
    "2-Primary-01",
    "2-Primary-02",
    "2-Primary-03",
    "2-Replica-01",
    "2-Replica-02"
  ]
}

### define host's role and subnet
variable "host_info" {
  default = {
    1-Primary-01 = {
      role   = "Admin"
      subnet = "1-public_subnet_1"
    }
    1-Primary-02 = {
      role   = "K8s_Primary"
      subnet = "1-public_subnet_1"
    }
    1-Primary-03 = {
      role   = "K8s_Primary"
      subnet = "1-public_subnet_2"
    }
    1-Replica-01 = {
      role   = "K8s_Replica"
      subnet = "1-public_subnet_1"
    }
    1-Replica-02 = {
      role   = "K8s_Replica"
      subnet = "1-public_subnet_2"
    }
    2-Primary-01 = {
      role   = "Admin"
      subnet = "2-public_subnet_1"
    }
    2-Primary-02 = {
      role   = "K8s_Primary"
      subnet = "2-public_subnet_1"
    }
    2-Primary-03 = {
      role   = "K8s_Primary"
      subnet = "2-public_subnet_2"
    }
    2-Replica-01 = {
      role   = "K8s_Replica"
      subnet = "2-public_subnet_1"
    }
    2-Replica-02 = {
      role   = "K8s_Replica"
      subnet = "2-public_subnet_2"
    }
  }
}

#### VPC PARAMS
variable "vpcs" {
  default = [
    "VPC-1",
    "VPC-2"
  ]
}

variable "vpc_info" {
  default = {
    VPC-1 = {
      vpc_cidr = "10.0.0.0/16"
    }
    VPC-2 = {
      vpc_cidr = "250.0.0.0/16"
    }
  }
}

#### SUBNET PARAMS
variable "subnets" {
  default = [
    "1-public_subnet_1",
    "1-public_subnet_2",
    "2-public_subnet_1",
    "2-public_subnet_2"
  ]
}

variable "subnet_info" {
  default = {
    1-public_subnet_1 = {
      vpc               = "VPC-1"
      cidr              = "10.0.1.0/24"
      availability_zone = "ap-northeast-2a"
    }
    1-public_subnet_2 = {
      vpc               = "VPC-1"
      cidr              = "10.0.2.0/24"
      availability_zone = "ap-northeast-2c"
    }
    2-public_subnet_1 = {
      vpc               = "VPC-2"
      cidr              = "250.0.1.0/24"
      availability_zone = "ap-northeast-2a"
    }
    2-public_subnet_2 = {
      vpc               = "VPC-2"
      cidr              = "250.0.2.0/24"
      availability_zone = "ap-northeast-2c"
    }
  }
}

### Centos7 AMI ID
variable "centos7" {
  type = string
  default = "ami-00014daafdc4239f4"
}
