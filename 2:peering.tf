####  VPC PEERING and ROUTING

##  Peer us-east-1 with all regions and add routes
#module "use2-vpcpeer" {
#  providers = {
#    aws = aws.use1
#  }
#  source                   = "./modules/peering/"
#  accepter_cidr_block      = local.cidr_blocks["us-east-2"]
#  accepter_region          = "us-east-2"
#  accepter_route_table_id  = module.use2-vpc.route_table_id
#  accepter_vpc_id          = module.use2-vpc.vpc_id
#  requester_cidr_block     = local.cidr_blocks["us-east-1"]
#  requester_region         = "us-east-1"
#  requester_route_table_id = module.use1-vpc.route_table_id
#  requester_vpc_id         = module.use1-vpc.vpc_id
#}
#
#module "usw1-vpcpeer" {
#  providers = {
#    aws = aws.use1
#  }
#  source                   = "./modules/peering/"
#  accepter_cidr_block      = local.cidr_blocks["us-west-1"]
#  accepter_region          = "us-west-1"
#  accepter_route_table_id  = module.usw1-vpc.route_table_id
#  accepter_vpc_id          = module.usw1-vpc.vpc_id
#  requester_cidr_block     = local.cidr_blocks["us-east-1"]
#  requester_region         = "us-east-1"
#  requester_route_table_id = module.use1-vpc.route_table_id
#  requester_vpc_id         = module.use1-vpc.vpc_id
#}
