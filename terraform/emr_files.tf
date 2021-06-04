module "emr_script" {
  source = "./blueprints/emr_script"

  bucket_name = module.buckets.buckets.configs
}

module "emr_libraries" {
  source = "./blueprints/emr_libraries/"

  bucket_name = module.buckets.buckets.configs
}