module "glue_database" {
  source = "./blueprints/glue_database/"

  environment         = var.environment
  bucket_name_curated = module.buckets.buckets.curated
}