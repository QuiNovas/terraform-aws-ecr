# terraform-aws-ecr

This module creates an Elastic Container Registry (ECR)

## Usage
Default encryption (AES-256)
```hcl
module "my_ecr_repo" {
  name   = "my-ecr-repo"
  source = "QuiNovas/ecr/aws"
}
```

With KMS Encryption
```hcl
module "my_ecr_repo" {
  name   = "my-ecr-repo"
  source = "QuiNovas/ecr/aws"

  encryption_type = "KMS"
  kms_key         = "arn:aws:kms:us-east-1:1234567890:key/0e3e29cf-bcff-48d2-a0a8-44d007fbcadc"
}
```

## Authors

Module managed by Quinovas (https://github.com/QuiNovas)

## License

Apache License, Version 2.0, January 2004 (http://www.apache.org/licenses/). See LICENSE for full details.