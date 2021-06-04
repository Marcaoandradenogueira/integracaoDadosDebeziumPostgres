# Buckets
module "buckets" {
  source = "./modules/buckets/"

  prefix      = local.prefix
  account_id  = local.account_id
  environment = local.environment

  tags = local.tags
}