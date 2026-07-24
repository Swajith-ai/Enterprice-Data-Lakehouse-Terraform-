#################################################
# Naming Prefix
#################################################

variable "naming_prefix" {


  description = "Common naming prefix for SNS resources."


  type = string

}





#################################################
# Notification Email
#################################################

variable "notification_email" {


  description = "Email address subscribed to SNS alerts."


  type = string


  default = null

}





#################################################
# Common Tags
#################################################

variable "common_tags" {


  description = "Common resource tags."


  type = map(string)

}

