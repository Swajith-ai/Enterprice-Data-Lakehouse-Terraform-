#################################################
# Step Functions Resource Naming
#################################################

locals {


  #################################################
  # State Machine Name
  #################################################

  state_machine_name = "${var.naming_prefix}-data-pipeline-workflow"



  #################################################
  # CloudWatch Log Group Name
  #################################################

  log_group_name = "/aws/vendedlogs/states/${local.state_machine_name}"



  #################################################
  # State Machine Description
  #################################################

  state_machine_description = "Enterprise Data Lakehouse workflow orchestration state machine"


}

