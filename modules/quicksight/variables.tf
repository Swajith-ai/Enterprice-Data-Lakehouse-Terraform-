#################################################
# AWS Account ID
#################################################

variable "aws_account_id" {


  description = "AWS account ID used by QuickSight."


  type = string

}





#################################################
# QuickSight User ARN
#################################################

variable "quicksight_user_arn" {


  description = "QuickSight user ARN for permissions."


  type = string

}





#################################################
# Athena Database Name
#################################################

variable "athena_database_name" {


  description = "Athena database used by QuickSight."


  type = string

}





#################################################
# Athena Workgroup Name
#################################################

variable "athena_workgroup_name" {


  description = "Athena workgroup used for queries."


  type = string

}





#################################################
# Athena Results Bucket
#################################################

variable "athena_results_bucket" {


  description = "S3 location where Athena query results are stored."


  type = string

}





#################################################
# Enable QuickSight
#################################################

variable "enable_quicksight" {


  description = "Enable or disable QuickSight resources."


  type = bool


  default = true

}





#################################################
# Common Tags
#################################################

variable "common_tags" {


  description = "Common resource tags."


  type = map(string)

}

