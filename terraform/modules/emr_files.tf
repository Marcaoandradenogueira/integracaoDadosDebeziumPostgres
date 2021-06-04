# TODO: Modificar o script para ler de subpastas relacionados a schema e frequencia
# Ex: S3_BUCKET/kafka/cdc/{schema}/{frequencia}
# TODO: Tem que modificar isso no Lambda tbm
module "emr_script" {
  source = "./blueprints/emr_script"

  bucket_name = module.buckets.buckets.configs
}

module "emr_libraries" {
  source = "./blueprints/emr_libraries/"

  bucket_name = module.buckets.buckets.configs
}