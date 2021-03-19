####  ROUTE53 peering and endpoints

##  Route53 endpoints
#module "use1-r53" {
#  providers = {
#    aws = aws.use1
#  }
#  source                     = "./modules/route53_endpoints/"
#  accepter_region            = "us-east-1"
#  accepter_vpc_id            = module.use1-vpc.vpc_id
#  route53_failover_subnet_id = module.use1-network.failover_subnet_id
#  route53_private_subnet_id  = module.use1-network.private_subnet_id
#}
#
#module "use2-r53" {
#  providers = {
#    aws = aws.use1
#  }
#  source                     = "./modules/route53_endpoints/"
#  accepter_region            = "us-east-2"
#  accepter_vpc_id            = module.use2-vpc.vpc_id
#  route53_failover_subnet_id = module.use2-network.failover_subnet_id
#  route53_private_subnet_id  = module.use2-network.private_subnet_id
#}

module "usw1-r53" {
  providers = {
    aws = aws.use1
  }
  source                     = "./modules/route53_endpoints/"
  accepter_region            = "us-west-1"
  accepter_vpc_id            = module.usw1-vpc.vpc_id
  route53_failover_subnet_id = module.usw1-network.failover_subnet_id
  route53_private_subnet_id  = module.usw1-network.private_subnet_id
}
