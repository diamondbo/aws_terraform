provider "aws" {
  region = "us-east-2"
}

module "main_vpc" {
  source = "./modules/VPC"

  cidr_block = "10.0.0.0/16"
}

module "public_subnet1" {
  source = "./modules/subnet"
  vpc_id = module.main_vpc.vpc_id
  availability_zone = "us-east-2a"
  subnet_cidr_block = "10.0.0.0/28"
  is_public = true
}

module "public_subnet2" {
  source = "./modules/subnet"
  vpc_id = module.main_vpc.vpc_id
  availability_zone = "us-east-2b"
  subnet_cidr_block = "10.0.0.16/28"
  is_public = true
}

module "public_subnet3" {
  source = "./modules/subnet"
  vpc_id = module.main_vpc.vpc_id
  availability_zone = "us-east-2c"
  subnet_cidr_block = "10.0.0.32/28"
  is_public = true
}

module "private_subnet1" {
  source = "./modules/subnet"
  vpc_id = module.main_vpc.vpc_id
  availability_zone = "us-east-2a"
  subnet_cidr_block = "10.0.0.48/28"
  is_public = false
}

module "private_subnet2" {
  source = "./modules/subnet"
  vpc_id = module.main_vpc.vpc_id
  availability_zone = "us-east-2b"
  subnet_cidr_block = "10.0.0.64/28"
  is_public = false
}

module "private_subnet3" {
  source = "./modules/subnet"
  vpc_id = module.main_vpc.vpc_id
  availability_zone = "us-east-2c"
  subnet_cidr_block = "10.0.0.80/28"
  is_public = false
}