#################################################
# Staging Environment Root Module
#################################################

module "enterprise_data_lakehouse" {


  source = "../../root"



  #################################################
  # Environment Configuration
  #################################################

  aws_region = "ap-south-1"



  project_name = "enterprise-data-lakehouse"



  environment = "stage"



  aws_account_id = var.aws_account_id



  common_tags = {


    Environment = "stage"


    ManagedBy = "Terraform"


    Lifecycle = "Pre-Production"


  }

}

