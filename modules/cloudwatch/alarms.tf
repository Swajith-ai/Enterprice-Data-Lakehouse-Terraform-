#################################################
# Lambda Error Alarm
#################################################

resource "aws_cloudwatch_metric_alarm" "lambda_errors" {


  alarm_name = local.lambda_error_alarm_name



  alarm_description = "Triggers when Lambda function errors exceed threshold."



  namespace = "AWS/Lambda"



  metric_name = "Errors"



  dimensions = {

    FunctionName = var.lambda_function_name

  }



  statistic = "Sum"



  period = 300



  evaluation_periods = 1



  threshold = 5



  comparison_operator = "GreaterThanOrEqualToThreshold"



  alarm_actions = var.sns_topic_arn != null ? [
    var.sns_topic_arn
  ] : []



  tags = var.common_tags

}






#################################################
# Lambda Duration Alarm
#################################################

resource "aws_cloudwatch_metric_alarm" "lambda_duration" {


  alarm_name = local.lambda_duration_alarm_name



  alarm_description = "Triggers when Lambda execution duration becomes high."



  namespace = "AWS/Lambda"



  metric_name = "Duration"



  dimensions = {

    FunctionName = var.lambda_function_name

  }



  statistic = "Average"



  period = 300



  evaluation_periods = 1



  threshold = 30000



  comparison_operator = "GreaterThanThreshold"



  alarm_actions = var.sns_topic_arn != null ? [
    var.sns_topic_arn
  ] : []



  tags = var.common_tags

}






#################################################
# Step Functions Failure Alarm
#################################################

resource "aws_cloudwatch_metric_alarm" "step_functions_failed" {


  alarm_name = local.step_functions_failure_alarm_name



  alarm_description = "Triggers when Step Functions executions fail."



  namespace = "AWS/States"



  metric_name = "ExecutionsFailed"



  dimensions = {

    StateMachineArn = var.state_machine_name

  }



  statistic = "Sum"



  period = 300



  evaluation_periods = 1



  threshold = 1



  comparison_operator = "GreaterThanOrEqualToThreshold"



  alarm_actions = var.sns_topic_arn != null ? [
    var.sns_topic_arn
  ] : []



  tags = var.common_tags

}






#################################################
# Glue Failure Alarms
#################################################

resource "aws_cloudwatch_metric_alarm" "glue_failures" {


  for_each = toset(var.glue_job_names)



  alarm_name = "${local.glue_failure_alarm_prefix}-${each.value}"



  alarm_description = "Triggers when Glue job fails."



  namespace = "Glue"



  metric_name = "glue.driver.aggregate.numFailedTasks"



  dimensions = {

    JobName = each.value

  }



  statistic = "Sum"



  period = 300



  evaluation_periods = 1



  threshold = 1



  comparison_operator = "GreaterThanOrEqualToThreshold"



  alarm_actions = var.sns_topic_arn != null ? [
    var.sns_topic_arn
  ] : []



  tags = var.common_tags

}

