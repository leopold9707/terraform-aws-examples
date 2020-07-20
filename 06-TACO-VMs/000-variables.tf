variable "spec" {
  default = {
    Admin = {
      flavor = "t2.medium"
      root_volume_size = "100"
      additional_volume = "50"
    }
    K8s_Primary = {
      flavor = "t2.medium"
      root_volume_size = "100"
      additional_volume = "50"
    }
    K8s_Replica = {
      flavor = "t2.medium"
      root_volume_size = "80"
      additional_volume = "50"
    },
    Container_registry = {
      flavor = "t2.medium"
      root_volume_size = "50"
      additional_volume = "100"
    },
    External_backend = {
      flavor = "t2.medium"
      root_volume_size = "50"
      additional_volume = "50"
    }
  }
}

variable "hosts" {
  default = [
    "Admin-01",
    "K8s_Primary-01",
    "K8s_Replica-01",
    "K8s_Replica-02",
    "Container_registry-01",
    "External_backend-01",
  ]
}

variable "spec_of_hosts" {
  default = {
    Admin-01 = {
      role = "Admin"
    }
    K8s_Primary-01 = {
      role = "K8s_Primary"
    }
    K8s_Replica-01 = {
      role = "K8s_Replica"
    }
    K8s_Replica-02 = {
      role = "K8s_Replica"
    }
    Container_registry-01 = {
      role = "Container_registry"
    }
    External_backend-01 = {
      role = "External_backend"
    }
  }
}

variable "centos7" {
  type = string
  default = "ami-00014daafdc4239f4"
}

#### VPC Network
variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

#### HTTP PARAMS
variable "network_http" {
  default = {
    subnet_name = "subnet_http"
    cidr        = "192.168.1.0/24"
  }
}

#### DB PARAMS
variable "network_db" {
  default = {
    subnet_name = "subnet_db"
    cidr        = "192.168.2.0/24"
  }
}
