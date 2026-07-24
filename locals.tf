#################################################
# Root Naming Configuration
#################################################

locals {


  #################################################
  # Platform Name
  #################################################

  platform_name = "${var.project_name}-${var.environment}"



  #################################################
  # Owner Metadata
  #################################################

  managed_by = "Terraform"



  #################################################
  # Platform Component
  #################################################

  platform_component = "Enterprise Data Lakehouse"



  #################################################
  # Common Metadata
  #################################################

  default_tags = {


    Project = var.project_name


    Environment = var.environment


    ManagedBy = local.managed_by


    Platform = local.platform_component

  }

}

