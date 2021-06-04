module "emr_lambda" {
  source = "./blueprints/lambda"
  count  = length(local.lambda_params)

  account_id    = local.account_id
  function_name = local.lambda_params[count.index].function_name
  env           = local.environment
  region        = local.region
  time_interval = local.lambda_params[count.index].time_interval

  bucket_config = module.buckets.buckets.configs

  tables = local.conf_tables.conf_schema

  lambda_environment = {
    variables = {
      ENV                  = local.environment
      KEY_NAME             = local.lambda_params[count.index].keypair_name
      MASTER_INSTANCE_TYPE = local.lambda_params[count.index].master_instance_type
      CORE_INSTANCE_TYPE   = local.lambda_params[count.index].core_instance_type
      EC2_MASTER_NAME      = local.lambda_params[count.index].ec2_master_name
      EC2_CORE_NAME        = local.lambda_params[count.index].ec2_core_name
      INSTANCE_COUNT       = local.lambda_params[count.index].instance_count
      EBS_SIZE_GB          = local.lambda_params[count.index].ebs_size_gb
      EC2_SUBNET_ID = local.lambda_params[count.index].ec2_subnet_id

      BUCKET_CONFIG    = module.buckets.buckets.configs
      JARS             = module.emr_libraries.jars
      SPARK_JOB_SCRIPT = module.emr_script.python_script

      BUCKET_NAME_RAW     = module.buckets.buckets.raw
      BUCKET_NAME_STAGED  = module.buckets.buckets.staged
      BUCKET_NAME_CURATED = module.buckets.buckets.curated

      GLUE_DATABASE = module.glue_database.database_name
    }
  }

  tags = local.tags
}



