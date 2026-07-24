#################################################
# Networking
#################################################

module "networking" {
  source = "./modules/networking"

  naming_prefix = "${var.project_name}-${var.environment}"

  vpc_cidr = "10.0.0.0/16"

  public_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]

  private_subnet_cidrs = [
    "10.0.10.0/24",
    "10.0.20.0/24"
  ]

  availability_zones = [
    "ap-south-1a",
    "ap-south-1b"
  ]

  common_tags = local.default_tags
}

#################################################
# KMS
#################################################

module "kms" {
  source = "./modules/kms"

  naming_prefix = "${var.project_name}-${var.environment}"

  kms_key_description = "Enterprise Data Lakehouse encryption key"

  kms_alias = "${var.project_name}-${var.environment}"

  deletion_window_in_days = 30

  enable_key_rotation = true

  common_tags = local.default_tags
}


#################################################
# S3
#################################################

module "s3" {
  source = "./modules/s3"

  naming_prefix = "${var.project_name}-${var.environment}"

  aws_region = var.aws_region

  kms_key_arn = module.kms.key_arn

  common_tags = local.default_tags
}


#################################################
# IAM
#################################################

module "iam" {
  source = "./modules/iam"

  naming_prefix = "${var.project_name}-${var.environment}"

  kms_key_arn = module.kms.key_arn

  raw_bucket_arn = module.s3.raw_bucket_arn

  processed_bucket_arn = module.s3.processed_bucket_arn

  curated_bucket_arn = module.s3.curated_bucket_arn

  common_tags = local.default_tags
}


#################################################
# Glue
#################################################

module "glue" {
  source = "./modules/glue"

  naming_prefix = "${var.project_name}-${var.environment}"

  aws_region = var.aws_region

  glue_role_arn = module.iam.glue_role_arn

  raw_bucket_name = module.s3.raw_bucket_name

  processed_bucket_name = module.s3.processed_bucket_name

  curated_bucket_name = module.s3.curated_bucket_name

  database_name = "${var.project_name}_${var.environment}"

  kms_key_arn = module.kms.key_arn

  common_tags = local.default_tags
}

#################################################
# Athena
#################################################

module "athena" {
  source = "./modules/athena"

  naming_prefix = "${var.project_name}-${var.environment}"

  aws_region = var.aws_region

  query_results_bucket = module.s3.athena_results_bucket

  glue_database_name = module.glue.database_name

  database_name = module.glue.database_name

  kms_key_arn = module.kms.key_arn

  common_tags = local.default_tags
}


#################################################
# Lambda
#################################################

module "lambda" {
  source = "./modules/lambda"

  naming_prefix = "${var.project_name}-${var.environment}"

  aws_region = var.aws_region

  lambda_role_arn = module.iam.lambda_role_arn

  source_bucket_name = module.s3.raw_bucket_name

  runtime = "python3.12"

  handler = "lambda_function.lambda_handler"

  common_tags = local.default_tags
}


#################################################
# Step Functions
#################################################

module "step_functions" {
  source = "./modules/step-functions"

  naming_prefix = "${var.project_name}-${var.environment}"

  aws_region = var.aws_region

  state_machine_role_arn = module.iam.step_functions_role_arn

  lambda_function_arn = module.lambda.function_arn

  common_tags = local.default_tags
}


#################################################
# CloudWatch
#################################################

module "cloudwatch" {
  source = "./modules/cloudwatch"

  naming_prefix = "${var.project_name}-${var.environment}"

  aws_region = var.aws_region

  lambda_function_name = module.lambda.function_name

  state_machine_name = module.step_functions.state_machine_name

  glue_job_names = module.glue.job_names

  sns_topic_arn = module.sns.topic_arn

  common_tags = local.default_tags
}


#################################################
# SNS
#################################################

module "sns" {
  source = "./modules/sns"

  naming_prefix = "${var.project_name}-${var.environment}"

  common_tags = local.default_tags
}


#################################################
# CloudTrail
#################################################

module "cloudtrail" {
  source = "./modules/cloudtrail"

  naming_prefix = "${var.project_name}-${var.environment}"

  audit_bucket_name = module.s3.audit_bucket_name

  kms_key_arn = module.kms.key_arn

  common_tags = local.default_tags
}


#################################################
# GuardDuty
#################################################

module "guardduty" {
  source = "./modules/guardduty"

  enable_guardduty = true

  enable_s3_protection = true

  enable_malware_protection = true

  enable_kubernetes_protection = false

  common_tags = local.default_tags
}


#################################################
# Secrets Manager
#################################################

module "secrets_manager" {
  source = "./modules/secrets-manager"

  secret_name = "${var.project_name}-${var.environment}"

  secret_description = "Enterprise Lakehouse secrets"

  secret_value = jsonencode({
    environment = var.environment
  })

  kms_key_arn = module.kms.key_arn

  common_tags = local.default_tags
}


#################################################
# QuickSight
#################################################

module "quicksight" {
  source = "./modules/quicksight"

  aws_account_id = var.aws_account_id

  quicksight_user_arn = var.quicksight_user_arn

  athena_database_name = module.glue.database_name

  athena_workgroup_name = module.athena.workgroup_name

  athena_results_bucket = module.s3.athena_results_bucket

  enable_quicksight = true

  common_tags = local.default_tags
}