#################################################
# Athena Resource Naming
#################################################

locals {


  #################################################
  # Athena Workgroup Name
  #################################################

  workgroup_name = "${var.naming_prefix}-athena-workgroup"



  #################################################
  # Query Result Location
  #################################################

  query_results_location = "s3://${var.query_results_bucket}/athena-results/"



  #################################################
  # Workgroup Description
  #################################################

  workgroup_description = "Enterprise Data Lakehouse Athena Analytics Workgroup"


}

