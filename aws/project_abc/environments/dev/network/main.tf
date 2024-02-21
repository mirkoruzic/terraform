module "vpc" {
  source              = "../../../modules/vpc"
  region              = "eu-west-1"
  environment_name    = var.env
  cidr_block          = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.3.0/24", "10.0.5.0/24" ]
  private_subnet_cidrs = ["10.0.2.0/24", "10.0.4.0/24", "10.0.6.0/24" ]
  availability_zones  = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  tags = {
    Environment = var.env
  }
}

module "alb_security_group" {
  source      = "../../../modules/sec_groups"
  vpc_id      = module.vpc.vpc_id
  name_prefix = "dev-alb-sg"
  ingress_rules = [
    {
      from_port   = 80,
      to_port     = 80,
      protocol    = "tcp",
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  egress_rules = [
    {
      from_port   = 0,
      to_port     = 0,
      protocol    = "-1",
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  tags = {
    Environment = var.env
}
}

module "ecs_security_group" {
  source      = "../../../modules/sec_groups"
  vpc_id      = module.vpc.vpc_id
  name_prefix = "${var.env}-ecs-sg"
  ingress_rules = [
    {
      from_port   = 8080,
      to_port     = 8080,
      protocol    = "tcp",
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  egress_rules = [
    {
      from_port   = 0,
      to_port     = 0,
      protocol    = "-1",
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  tags = {
    Environment = var.env
  }
}

module "rds_aurora_security_group" {
  source      = "../../../modules/sec_groups"
  vpc_id      = module.vpc.vpc_id
  name_prefix = "${var.env}-aurora-sg"
  ingress_rules = [
    {
      from_port   = 3306,
      to_port     = 3306,
      protocol    = "tcp",
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  egress_rules = [
    {
      from_port   = 0,
      to_port     = 0,
      protocol    = "-1",
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  tags = {
    Environment = var.env
  }
}

module "https_security_group" {
  source      = "../../../modules/sec_groups"
  vpc_id      = module.vpc.vpc_id
  name_prefix = "${var.env}-https-sg"
  ingress_rules = [
    {
      from_port   = 443,
      to_port     = 443,
      protocol    = "tcp",
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  egress_rules = [
    {
      from_port   = 0,
      to_port     = 0,
      protocol    = "-1",
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
  tags = {
    Environment = var.env
  }
}
