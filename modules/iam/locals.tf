#################################################
# Local Naming Convention
#################################################

locals {

  #################################################
  # IAM Role Names
  #################################################

  glue_role_name = "${var.naming_prefix}-glue-role"

  lambda_role_name = "${var.naming_prefix}-lambda-role"

  athena_role_name = "${var.naming_prefix}-athena-role"

  cloudwatch_role_name = "${var.naming_prefix}-cloudwatch-role"

  #################################################
  # IAM Policy Names
  #################################################

  glue_policy_name = "${var.naming_prefix}-glue-policy"

  lambda_policy_name = "${var.naming_prefix}-lambda-policy"

  athena_policy_name = "${var.naming_prefix}-athena-policy"

  cloudwatch_policy_name = "${var.naming_prefix}-cloudwatch-policy"

}

