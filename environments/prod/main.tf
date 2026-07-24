#################################################
# Production Environment Root Module
#################################################

module "enterprise_data_lakehouse" {


  source = "../../root"



  #################################################
  # Environment Configuration
  #################################################

  aws_region = "ap-south-1"



  project_name = "enterprise-data-lakehouse"



  environment = "prod"



  aws_account_id = var.aws_account_id



  common_tags = {


    Environment = "prod"



    ManagedBy = "Terraform"



    Lifecycle = "Production"



    Criticality = "High"


  }

}

