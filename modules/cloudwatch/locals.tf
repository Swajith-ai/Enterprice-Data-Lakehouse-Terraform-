#################################################
# CloudWatch Resource Naming
#################################################

locals {


  #################################################
  # Dashboard Name
  #################################################

  dashboard_name = "${var.naming_prefix}-monitoring-dashboard"



  #################################################
  # Lambda Error Alarm Name
  #################################################

  lambda_error_alarm_name = "${var.naming_prefix}-lambda-errors"



  #################################################
  # Lambda Duration Alarm Name
  #################################################

  lambda_duration_alarm_name = "${var.naming_prefix}-lambda-duration"



  #################################################
  # Step Functions Failure Alarm Name
  #################################################

  step_functions_failure_alarm_name = "${var.naming_prefix}-workflow-failures"



  #################################################
  # Glue Failure Alarm Prefix
  #################################################

  glue_failure_alarm_prefix = "${var.naming_prefix}-glue-failure"



}

