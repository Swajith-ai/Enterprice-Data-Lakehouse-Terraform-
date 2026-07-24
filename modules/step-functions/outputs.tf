#################################################
# State Machine Name
#################################################

output "state_machine_name" {


  description = "Name of the Step Functions state machine."


  value = aws_sfn_state_machine.pipeline.name


}





#################################################
# State Machine ARN
#################################################

output "state_machine_arn" {


  description = "ARN of the Step Functions state machine."


  value = aws_sfn_state_machine.pipeline.arn


}





#################################################
# Step Functions IAM Role ARN
#################################################

output "state_machine_role_arn" {


  description = "IAM role ARN used by Step Functions."


  value = aws_iam_role.step_functions.arn


}





#################################################
# CloudWatch Log Group Name
#################################################

output "log_group_name" {


  description = "CloudWatch log group for Step Functions executions."


  value = aws_cloudwatch_log_group.step_functions.name


}

