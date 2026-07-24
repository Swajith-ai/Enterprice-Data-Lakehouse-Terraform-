#################################################
# Lambda Resource Naming
#################################################

locals {


  #################################################
  # Lambda Function Name
  #################################################

  function_name = "${var.naming_prefix}-validation-function"



  #################################################
  # CloudWatch Log Group Name
  #################################################

  log_group_name = "/aws/lambda/${local.function_name}"



  #################################################
  # Lambda Description
  #################################################

  function_description = "Enterprise Data Lakehouse data validation Lambda function"


}

