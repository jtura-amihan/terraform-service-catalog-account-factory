terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.54.0"
    }
  }
}
provider "aws" {
  profile = "default"
  region  = "ap-southeast-1"
}
resource "random_id" "id" {
  byte_length = 8
}
#Confirm user can launch product  - No launch paths has many reasons for failure.
resource "aws_servicecatalog_provisioned_product" "accountfactory" {
  name                     = "aft-${random_id.id.hex}"
  product_id               = "prod-mjdpvehvq32te"
  provisioning_artifact_id = "pa-qshlqbdxywvuo"
  provisioning_parameters {
    key   = "SSOUserEmail"
    value = "jtura+sandbox2@agsx.net"
  }
  provisioning_parameters {
    key   = "SSOUserFirstName"
    value = "Test"
  }
  provisioning_parameters {
    key   = "SSOUserLastName"
    value = "Account-1"
  }
  provisioning_parameters {
    key   = "ManagedOrganizationalUnit"
    value = "Sandbox"
  }
  provisioning_parameters {
    key   = "AccountName"
    value = "Test-Account-1"
  }
  provisioning_parameters {
    key   = "AccountEmail"
    value = "jtura+sandbox2@agsx.net"
  }
  tags = {
    TFLaunched = "True"
  }
}
