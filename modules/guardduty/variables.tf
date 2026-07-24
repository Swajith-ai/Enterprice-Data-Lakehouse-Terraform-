#################################################
# Enable GuardDuty
#################################################

variable "enable_guardduty" {


  description = "Enable or disable GuardDuty detector."


  type = bool


  default = true

}





#################################################
# Enable S3 Protection
#################################################

variable "enable_s3_protection" {


  description = "Enable GuardDuty S3 protection."


  type = bool


  default = true

}





#################################################
# Enable Malware Protection
#################################################

variable "enable_malware_protection" {


  description = "Enable GuardDuty malware protection."


  type = bool


  default = true

}





#################################################
# Enable Kubernetes Protection
#################################################

variable "enable_kubernetes_protection" {


  description = "Enable GuardDuty Kubernetes protection."


  type = bool


  default = false

}





#################################################
# Common Tags
#################################################

variable "common_tags" {


  description = "Common resource tags."


  type = map(string)

}

