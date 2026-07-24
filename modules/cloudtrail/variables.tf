#################################################
# Naming Prefix
#################################################

variable "naming_prefix" {


  description = "Common naming prefix for CloudTrail resources."


  type = string

}





#################################################
# Audit Log Bucket Name
#################################################

variable "audit_bucket_name" {


  description = "S3 bucket name used for CloudTrail audit logs."


  type = string

}





#################################################
# KMS Key ARN
#################################################

variable "kms_key_arn" {


  description = "KMS key ARN used to encrypt CloudTrail logs."


  type = string


}





#################################################
# Log Retention Days
#################################################

variable "retention_days" {


  description = "Number of days to retain CloudTrail logs."


  type = number


  default = 365

}





#################################################
# Enable Multi Region Trail
#################################################

variable "enable_multi_region" {


  description = "Enable CloudTrail logging across all AWS regions."


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

