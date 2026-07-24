#################################################
# AWS Region
#################################################

variable "aws_region" {
  description = "AWS deployment region."
  type        = string
  default     = "ap-south-1"
}


#################################################
# Project Name
#################################################

variable "project_name" {
  description = "Name of the project."
  type        = string
  default     = "enterprise-data-lakehouse"
}


#################################################
# Environment
#################################################

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"
}


#################################################
# AWS Account ID
#################################################

variable "aws_account_id" {
  description = "AWS account identifier."
  type        = string
}


#################################################
# Common Tags
#################################################

variable "common_tags" {
  description = "Common tags applied to resources."
  type        = map(string)
  default     = {}
}

variable "quicksight_user_arn" {

  description = "QuickSight user ARN."

  type = string

}