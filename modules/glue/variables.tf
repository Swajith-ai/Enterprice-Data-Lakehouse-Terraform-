#################################################
# Naming Prefix
#################################################

variable "naming_prefix" {

  description = "Common naming prefix for Glue resources."

  type = string

}


#################################################
# AWS Region
#################################################

variable "aws_region" {

  description = "AWS Region where Glue resources are created."

  type = string

}


#################################################
# Glue IAM Role ARN
#################################################

variable "glue_role_arn" {

  description = "IAM Role ARN used by AWS Glue jobs and crawlers."

  type = string

}


#################################################
# Raw Bucket Name
#################################################

variable "raw_bucket_name" {

  description = "S3 Raw bucket name."

  type = string

}


#################################################
# Processed Bucket Name
#################################################

variable "processed_bucket_name" {

  description = "S3 Processed bucket name."

  type = string

}


#################################################
# Curated Bucket Name
#################################################

variable "curated_bucket_name" {

  description = "S3 Curated bucket name."

  type = string

}


#################################################
# Common Tags
#################################################

variable "common_tags" {

  description = "Common tags applied to Glue resources."

  type = map(string)

}

variable "database_name" {
  description = "Glue Catalog database name."
  type        = string
}


variable "kms_key_arn" {

  description = "KMS key ARN for Glue encryption"

  type = string

}


