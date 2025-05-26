module "ec2" {
  source    = "../../modules/ec2"
  subnet_id = module.subnet.subnet_id
  instance_ami  = var.ami
  instance_type = var.instance_type
  tags = merge(
    var.common_tags,
    {
      Name          = "${local.env}-${local.app}-ec2"
      resource_type = "compute"
    },
  )
}

# module "s3" {
#   source      = "../../modules/s3"
#   bucket_name = var.bucket_name
#   tags = merge(
#     var.common_tags,
#     {
#       Name          = "${local.env}-${local.app}-s3"
#       resource_type = "storage"
#     },
#   )
# }

# EIP for NAT Gateway 
module "eip" {
  source      = "../../modules/eip"
  instance_id = ""
  tags = merge(
    var.common_tags,
    {
      Name          = "${local.env}-${local.app}-nat-eip"
      resource_type = "network"
      purpose       = "nat-gateway"
    },
  )
}

module "vpc" {
  source     = "../../modules/vpc"
  vpc_cidr_block   = var.vpc_cidr_block
  vpc_tags = merge(
    var.common_tags,
    {
      Name          = "${local.env}-${local.app}-vpc"
      resource_type = "network"
    },
  )
}

module "subnet" {
  source            = "../../modules/subnet"
  vpc_id            = module.vpc.vpc_id
  aws_subnet_name   = "${local.env}-${local.app}-subnet"
  subnet_cidr_block = var.subnet_cidr_block
  availability_zone = var.availability_zone
  subnet_tags = merge(
    var.common_tags,
    {
      Name          = "${local.env}-${local.app}-subnet"
      resource_type = "network"
    },
  )
}

# Adding Internet Gateway module
module "igw" {
  source  = "../../modules/igw"
  vpc_id  = module.vpc.vpc_id
  igw_tags = merge(
    var.common_tags,
    var.igw_tags,
    {
      Name          = "${local.env}-${local.app}-igw"
      resource_type = "network"
    },
  )
}

# Adding NAT Gateway module (depends on EIP and IGW)
module "nat" {
  source         = "../../modules/nat"
  allocation_id  = module.eip.allocation_id
  subnet_id      = module.subnet.subnet_id
  depends_on_resource = [module.igw.igw_id]
  nat_tags = merge(
    var.common_tags,
    {
      Name          = "${local.env}-${local.app}-nat"
      resource_type = "network"
    },
  )
}

# Adding Security Group module
module "security_group" {
  source                  = "../../modules/security_group"
  vpc_id                  = module.vpc.vpc_id
  security_group_name     = var.security_group_name
  security_group_description = var.security_group_description
  ingress_rules           = var.ingress_rules
  egress_rules            = var.egress_rules
  security_group_tags = merge(
    var.common_tags,
    {
      Name          = "${local.env}-${local.app}-sg"
      resource_type = "network"
    },
  )
}