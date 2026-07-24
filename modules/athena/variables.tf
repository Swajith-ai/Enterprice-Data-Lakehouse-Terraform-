#################################################
# Naming Prefix
#################################################

variable "naming_prefix" {

  description = "Common naming prefix for Athena resources."

  type = string

}



#################################################
# AWS Region
#################################################

variable "aws_region" {

  description = "AWS region where Athena resources are created."

  type = string

}



#################################################
# Query Result Bucket
#################################################

variable "query_results_bucket" {

  description = "S3 bucket used for Athena query results."

  type = string

}



#################################################
# KMS Key ARN
#################################################

variable "kms_key_arn" {

  description = "KMS key ARN used for Athena encryption."

  type = string

}



#################################################
# Glue Database Name
#################################################

variable "glue_database_name" {

  description = "Glue Catalog database used by Athena."

  type = string

}



#################################################
# Common Tags
#################################################

variable "common_tags" {

  description = "Common resource tags."

  type = map(string)

}

variable "database_name" {

  description = "Athena target database name."

  type = string

}

