#################################################
# Development Environment Backend
#################################################

bucket = "enterprise-data-lakehouse-terraform-state"

key = "dev/terraform.tfstate"

region = "ap-south-1"

dynamodb_table = "enterprise-data-lakehouse-locks"

encrypt = true