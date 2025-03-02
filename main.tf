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
module "private_data_subnet1" {
  source = "./modules/subnet"
  vpc_id = module.main_vpc.vpc_id
  availability_zone = "us-east-2a"
  subnet_cidr_block = "10.0.0.96/28"
  is_public = false
}

module "private_data_subnet2" {
  source = "./modules/subnet"
  vpc_id = module.main_vpc.vpc_id
  availability_zone = "us-east-2b"
  subnet_cidr_block = "10.0.0.112/28"
  is_public = false
}

module "private_data_subnet3" {
  source = "./modules/subnet"
  vpc_id = module.main_vpc.vpc_id
  availability_zone = "us-east-2c"
  subnet_cidr_block = "10.0.0.128/28"
  is_public = false
}

module "routing" {
  source = "./modules/routing"
  vpc_id = module.main_vpc.vpc_id
  public_subnet_id_1 = module.public_subnet1.subnet_id
  public_subnet_id_2 = module.public_subnet2.subnet_id
  public_subnet_id_3 = module.public_subnet3.subnet_id
  private_subnet_id_1 = module.private_subnet1.subnet_id
  private_subnet_id_2 = module.private_subnet2.subnet_id
  private_subnet_id_3 = module.private_subnet3.subnet_id
  
}