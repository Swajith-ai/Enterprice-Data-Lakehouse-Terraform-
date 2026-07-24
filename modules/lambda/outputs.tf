#################################################
# Lambda Function Name
#################################################

output "function_name" {

  description = "Name of the Lambda validation function."

  value = aws_lambda_function.validation.function_name

}



#################################################
# Lambda Function ARN
#################################################

output "function_arn" {

  description = "ARN of the Lambda validation function."

  value = aws_lambda_function.validation.arn

}



#################################################
# Lambda IAM Role ARN
#################################################

output "lambda_role_arn" {

  description = "IAM role ARN attached to Lambda."

  value = aws_iam_role.lambda.arn

}



#################################################
# CloudWatch Log Group
#################################################

output "log_group_name" {

  description = "CloudWatch Log Group used by Lambda."

  value = aws_cloudwatch_log_group.lambda.name

}

