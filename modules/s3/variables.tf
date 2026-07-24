#################################################
# Naming Prefix
#################################################

variable "naming_prefix" {

  description = "Common naming prefix for S3 buckets."

  type = string

}

#################################################
# AWS Region
#################################################

variable "aws_region" {

  description = "AWS Region where the buckets are deployed."

  type = string

}

#################################################
# KMS Key ARN
#################################################

variable "kms_key_arn" {

  description = "ARN of the KMS key used for bucket encryption."

  type = string

}

#################################################
# Common Tags
#################################################

variable "common_tags" {

  description = "Common tags applied to all S3 resources."

  type = map(string)

}

