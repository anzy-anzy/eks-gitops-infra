data "aws_ami" "amazon_linux_2" {
  most_recent = true

  owners = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

module "vpc" {
  source = "./vpc"
}

module "eks" {
  source          = "./eks"
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets
}

module "ecr" {
  source = "./ecr"
}

module "vault" {
  source           = "./vault"
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnets[0]
  ami_id           = data.aws_ami.amazon_linux_2.id
}