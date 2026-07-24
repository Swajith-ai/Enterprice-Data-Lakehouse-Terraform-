#################################################
# Naming Prefix
#################################################

variable "naming_prefix" {

  description = "Common naming prefix for CloudWatch resources."

  type = string

}



#################################################
# AWS Region
#################################################

variable "aws_region" {

  description = "AWS region where monitoring resources are deployed."

  type = string

}



#################################################
# Lambda Function Name
#################################################

variable "lambda_function_name" {

  description = "Lambda function name to monitor."

  type = string

}



#################################################
# Step Functions State Machine Name
#################################################

variable "state_machine_name" {

  description = "Step Functions state machine name to monitor."

  type = string

}



#################################################
# Glue Job Names
#################################################

variable "glue_job_names" {

  description = "List of Glue jobs to monitor."

  type = list(string)

  default = []

}



#################################################
# SNS Topic ARN
#################################################

variable "sns_topic_arn" {

  description = "SNS topic ARN used for CloudWatch alarm notifications."

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

