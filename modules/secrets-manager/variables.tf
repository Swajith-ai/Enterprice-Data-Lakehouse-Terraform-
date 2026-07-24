#################################################
# Secret Name
#################################################

variable "secret_name" {


  description = "Name of the secret."


  type = string

}





#################################################
# Secret Description
#################################################

variable "secret_description" {


  description = "Description of the secret."


  type = string


  default = ""

}





#################################################
# Secret Value
#################################################

variable "secret_value" {


  description = "Sensitive value stored in Secrets Manager."


  type = string


  sensitive = true

}





#################################################
# KMS Key ARN
#################################################

variable "kms_key_arn" {


  description = "KMS key ARN used for secret encryption."


  type = string

}





#################################################
# Recovery Window
#################################################

variable "recovery_window_days" {


  description = "Number of days before deleted secrets are permanently removed."


  type = number


  default = 30

}





#################################################
# Enable Secret Creation
#################################################

variable "enable_secret" {


  description = "Enable or disable secret creation."


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

