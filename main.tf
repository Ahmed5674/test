provider "aws" {
  alias  = "account1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "account2"
  region = "us-west-2"
}

module "vpc_account1" {
  source = "./modules/vpc"
  providers = {
    aws = aws.account1
  }

  vpc_cidr_block      = var.vpc_cidr_block
  public_subnet_count = var.public_subnet_count
  private_subnet_count = var.private_subnet_count
  availability_zones  = var.availability_zones
}

module "vpc_account2" {
  source = "./modules/vpc"
  providers = {
    aws = aws.account2
  }

  vpc_cidr_block      = var.vpc_cidr_block
  public_subnet_count = var.public_subnet_count
  private_subnet_count = var.private_subnet_count
  availability_zones  = var.availability_zones
}

