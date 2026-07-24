#################################################
# Athena Data Catalog
#################################################

resource "aws_athena_data_catalog" "glue" {


  name = "AwsDataCatalog"



  type = "GLUE"



  description = "AWS Glue Data Catalog used by Enterprise Data Lakehouse Athena"



  parameters = {

    catalog_name = var.glue_database_name

  }

}

