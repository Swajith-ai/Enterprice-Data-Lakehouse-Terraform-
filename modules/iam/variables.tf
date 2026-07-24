#################################################
# Naming Prefix
#################################################

variable "naming_prefix" {

  description = "Common naming prefix."

  type = string

}

#################################################
# Common Tags
#################################################

variable "common_tags" {

  description = "Common tags applied to IAM resources."

  type = map(string)

}

#################################################
# KMS Key ARN
#################################################

variable "kms_key_arn" {

  description = "ARN of the KMS key used for encryption."

  type = string

}

#################################################
# Raw S3 Bucket ARN
#################################################

variable "raw_bucket_arn" {

  description = "ARN of the Raw Data S3 bucket."

  type = string

}

#################################################
# Processed S3 Bucket ARN
#################################################

variable "processed_bucket_arn" {

  description = "ARN of the Processed Data S3 bucket."

  type = string

}

#################################################
# Curated S3 Bucket ARN
#################################################

variable "curated_bucket_arn" {

  description = "ARN of the Curated Data S3 bucket."

  type = string

}

