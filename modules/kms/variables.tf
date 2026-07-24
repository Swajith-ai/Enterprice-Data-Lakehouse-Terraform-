#################################################
# KMS Key Description
#################################################

variable "kms_key_description" {

  description = "Description of the KMS key."

  type = string

}

#################################################
# KMS Alias
#################################################

variable "kms_alias" {

  description = "Alias for the KMS key."

  type = string

}

#################################################
# Deletion Window
#################################################

variable "deletion_window_in_days" {

  description = "Number of days before a scheduled KMS key deletion."

  type = number

}

#################################################
# Enable Key Rotation
#################################################

variable "enable_key_rotation" {

  description = "Enable automatic KMS key rotation."

  type = bool

}

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

  description = "Common tags applied to all resources."

  type = map(string)

}

