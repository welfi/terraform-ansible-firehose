terraform {
  backend "s3" {
    region = "us-west-2"
    bucket = "daredata-s3"
    key    = "tfstates/"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source   = "./modules/vpc"
  app_name = var.app_name
  stage    = var.stage
}

module "kinesis_firehose" {
  source = "./modules/kinesis_firehose"
}

module "http-server" {
  depends_on = [
    module.vpc
  ]
  source                   = "./modules/http-server"
  app_name                 = var.app_name
  stage                    = var.stage
  ssh_key_name             = var.ssh_key_name
  vpc_security_group_ids   = module.vpc.vpc_security_group_ids
  security_group           = module.vpc.security_group
  subnet_id                = module.vpc.subnet_server
  instance_type            = var.instance_type
  elastic_ip_allocation_id = var.http_server_elastic_ip_allocation_id
}

