####  VPC and NETWORK COMPONENTS

###  PROD/PRIMARY region
#module "use1-vpc" {
#  source = "./modules/vpc/"
#  providers = {
#    aws = aws.use1
#  }
#  cidr_block = local.cidr_blocks["us-east-1"]
#}
#
#module "use1-network" {
#  source = "./modules/network/"
#  providers = {
#    aws = aws.use1
#  }
#  failover_scope = local.failover_scopes["us-east-1"]
#  private_scope = local.private_scopes["us-east-1"]
#  public_scope = local.public_scopes["us-east-1"]
#  route_table_id = module.use1-vpc.route_table_id
#  vpc_id = module.use1-vpc.vpc_id
#}
#
###  DR/alternate region
#module "use2-vpc" {
#  source = "./modules/vpc/"
#  providers = {
#    aws = aws.use2
#  }
#  cidr_block = local.cidr_blocks["us-east-2"]
#}
#
#module "use2-network" {
#  source = "./modules/network/"
#  providers = {
#    aws = aws.use2
#  }
#  failover_scope = local.failover_scopes["us-east-2"]
#  private_scope = local.private_scopes["us-east-2"]
#  public_scope = local.public_scopes["us-east-2"]
#  route_table_id = module.use2-vpc.route_table_id
#  vpc_id = module.use2-vpc.vpc_id
#}

##  SANDBOX/test region
module "usw1-vpc" {
  source = "./modules/vpc/"
  providers = {
    aws = aws.usw1
  }
  cidr_block = local.cidr_blocks["us-west-1"]
}

module "usw1-network" {
  source = "./modules/network/"
  providers = {
    aws = aws.usw1
  }
  failover_scope = local.failover_scopes["us-west-1"]
  private_scope  = local.private_scopes["us-west-1"]
  public_scope   = local.public_scopes["us-west-1"]
  route_table_id = module.usw1-vpc.route_table_id
  vpc_id         = module.usw1-vpc.vpc_id
}
