#################################################
# Naming Prefix
#################################################

variable "naming_prefix" {

  description = "Common naming prefix for Step Functions resources."

  type = string

}



#################################################
# AWS Region
#################################################

variable "aws_region" {

  description = "AWS region where Step Functions are deployed."

  type = string

}



#################################################
# State Machine IAM Role ARN
#################################################

variable "state_machine_role_arn" {

  description = "IAM role used by Step Functions."

  type = string

}



#################################################
# Lambda Function ARN
#################################################

variable "lambda_function_arn" {

  description = "Lambda function executed by workflow."

  type = string

}



#################################################
# Common Tags
#################################################

variable "common_tags" {

  description = "Common resource tags."

  type = map(string)

}

