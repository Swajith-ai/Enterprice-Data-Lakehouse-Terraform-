#################################################
# Dashboard Name
#################################################

output "dashboard_name" {


  description = "CloudWatch dashboard name."


  value = aws_cloudwatch_dashboard.main.dashboard_name


}





#################################################
# Lambda Log Group Name
#################################################

output "lambda_log_group_name" {


  description = "CloudWatch log group for Lambda."


  value = aws_cloudwatch_log_group.lambda.name


}





#################################################
# Step Functions Log Group Name
#################################################

output "step_functions_log_group_name" {


  description = "CloudWatch log group for Step Functions."


  value = aws_cloudwatch_log_group.step_functions.name


}





#################################################
# Lambda Error Alarm Name
#################################################

output "lambda_error_alarm_name" {


  description = "Lambda error alarm name."


  value = aws_cloudwatch_metric_alarm.lambda_errors.alarm_name


}





#################################################
# Step Functions Failure Alarm Name
#################################################

output "step_functions_failure_alarm_name" {


  description = "Step Functions failure alarm name."


  value = aws_cloudwatch_metric_alarm.step_functions_failed.alarm_name


}

