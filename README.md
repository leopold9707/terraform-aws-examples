## Terraform introduction

Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions.


## Terraform versions

For Terraform 0.12 use version v2.* of this module.

If you are using Terraform 0.11 you can use versions v1.*.


## AWS authentification

### (recommend) Using credential file

credential file 사용을 가정하여 코드가 작성되어있습니다. ~/.aws/credentials 위치에 접속정보를 담으면 사용할 수 있습니다.

```
$ mkdir -p  ~/.aws
$ cd ~/.aws
$ vi credentials
[default]
aws_access_key_id=AB81...
aws_secret_access_key=MFSh7...
```

### Using AWS provider.tf

The AWS provider is used to interact with the many resources supported by AWS. The provider needs to be configured with the proper credentials before it can be used.

```
provider "aws" {
  access_key = "secret"
  secret_key = "secret"
  region     = "ap-northeast-2"
}
```

## Getting Started

Before terraform apply you must download provider plugin:

```
terraform init
```

Display plan before apply manifest
```
terraform plan
```

Apply manifest
```
terraform apply
```

Destroy stack
```
terraform destroy
```

## Documentation
[https://www.terraform.io/docs/providers/aws//](https://www.terraform.io/docs/providers/aws/)

[https://github.com/terraform-providers/terraform-provider-aws/tree/master/examples](https://github.com/terraform-providers/terraform-provider-aws/tree/master/examples)
