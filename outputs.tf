#################################################
# VPC ID
#################################################

output "vpc_id" {


  description = "VPC identifier."


  value = module.networking.vpc_id

}





#################################################
# Data Lake Bucket
#################################################

output "data_lake_bucket" {


  description = "Primary data lake bucket."


  value = module.s3.bucket_name

}





#################################################
# KMS Key ARN
#################################################

output "kms_key_arn" {


  description = "Customer managed KMS key ARN."


  value = module.kms.key_arn

}





#################################################
# Glue Database
#################################################

output "glue_database_name" {


  description = "Glue catalog database name."


  value = module.glue.database_name

}





#################################################
# Athena Workgroup
#################################################

output "athena_workgroup" {


  description = "Athena workgroup name."


  value = module.athena.workgroup_name

}





#################################################
# CloudTrail ARN
#################################################

output "cloudtrail_arn" {


  description = "CloudTrail ARN."


  value = module.cloudtrail.trail_arn

}





#################################################
# Secrets Manager ARN
#################################################

output "secret_arn" {


  description = "Secrets Manager secret ARN."


  value = module.secrets_manager.secret_arn

}





#################################################
# QuickSight Dataset ARN
#################################################

output "quicksight_dataset_arn" {


  description = "QuickSight dataset ARN."


  value = module.quicksight.dataset_arn

}

