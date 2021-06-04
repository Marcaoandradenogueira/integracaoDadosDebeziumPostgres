module "ec2" {
  source = "./blueprints/ec2/"

  environment = local.environment

  instance_name        = "kafka-deltalake"
  instance_type        = "t2.micro"
  keypair_name         = var.instances_params.kafka_delta.keypair_name
  subnet_id            = var.instances_params.kafka_delta.subnet_id
  vpc_id               = var.instances_params.kafka_delta.vpc_id
  volume_size          = "50"
  volume_type          = "gp2"

  bucket_artifacts = module.buckets.buckets.configs
  bucket_raw       = module.buckets.buckets.raw
  
}