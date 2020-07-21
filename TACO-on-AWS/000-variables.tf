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
    "Primary-101",
    "Primary-102",
    "Primary-103",
    "Replica-101",
    "Replica-102",
### VMs in VPC-2
    "Primary-201",
    "Primary-202",
    "Primary-203",
    "Replica-201",
    "Replica-202"
  ]
}

### define host's role and subnet
variable "host_info" {
  default = {
    Primary-101 = {
      role   = "Admin"
      subnet = "public_subnet_10_0_1"
    }
    Primary-102 = {
      role   = "K8s_Primary"
      subnet = "public_subnet_10_0_1"
    }
    Primary-103 = {
      role   = "K8s_Primary"
      subnet = "public_subnet_10_0_2"
    }
    Replica-101 = {
      role   = "K8s_Replica"
      subnet = "public_subnet_10_0_1"
    }
    Replica-102 = {
      role   = "K8s_Replica"
      subnet = "public_subnet_10_0_2"
    }
    Primary-201 = {
      role   = "Admin"
      subnet = "public_subnet_250_0_1"
    }
    Primary-202 = {
      role   = "K8s_Primary"
      subnet = "public_subnet_250_0_1"
    }
    Primary-203 = {
      role   = "K8s_Primary"
      subnet = "public_subnet_250_0_2"
    }
    Replica-201 = {
      role   = "K8s_Replica"
      subnet = "public_subnet_250_0_1"
    }
    Replica-202 = {
      role   = "K8s_Replica"
      subnet = "public_subnet_250_0_2"
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
    "public_subnet_10_0_1",
    "public_subnet_10_0_2",
    "public_subnet_250_0_1",
    "public_subnet_250_0_2"
  ]
}

variable "subnet_info" {
  default = {
    public_subnet_10_0_1 = {
      vpc               = "VPC-1"
      cidr              = "10.0.1.0/24"
      availability_zone = "ap-northeast-2a"
    }
    public_subnet_10_0_2 = {
      vpc               = "VPC-1"
      cidr              = "10.0.2.0/24"
      availability_zone = "ap-northeast-2c"
    }
    public_subnet_250_0_1 = {
      vpc               = "VPC-2"
      cidr              = "250.0.1.0/24"
      availability_zone = "ap-northeast-2a"
    }
    public_subnet_250_0_2 = {
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
