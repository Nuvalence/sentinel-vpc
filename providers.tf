###########################
##  REGIONAL VPC
###########################

###  Backend
terraform {
  backend "s3" {
    bucket = "tfstate-hunting-ops"
    key    = "regional_vpc"
    region = "us-east-1"
  }
  required_version = "> 0.14"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.10"
    }
  }
}

###  Regional providers
provider "aws" {
  region = "us-east-1"
  alias  = "use1"
}

provider "aws" {
  region = "us-east-2"
  alias  = "use2"
}

provider "aws" {
  region = "us-west-1"
  alias  = "usw1"
}
