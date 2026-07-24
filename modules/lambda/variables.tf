#################################################
# Naming Prefix
#################################################

variable "naming_prefix" {

  description = "Common naming prefix for Lambda resources."

  type = string

}



#################################################
# AWS Region
#################################################

variable "aws_region" {

  description = "AWS region where Lambda functions are deployed."

  type = string

}



#################################################
# Lambda Runtime
#################################################

variable "runtime" {

  description = "Lambda runtime environment."

  type = string

  default = "python3.12"

}



#################################################
# Lambda Handler
#################################################

variable "handler" {

  description = "Lambda function entry point."

  type = string

  default = "lambda_function.lambda_handler"

}



#################################################
# Lambda IAM Role ARN
#################################################

variable "lambda_role_arn" {

  description = "IAM role used by Lambda functions."

  type = string

}



#################################################
# Source Bucket Name
#################################################

variable "source_bucket_name" {

  description = "S3 bucket that triggers Lambda."

  type = string

}



#################################################
# Common Tags
#################################################

variable "common_tags" {

  description = "Common resource tags."

  type = map(string)

}

