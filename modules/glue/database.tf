#################################################
# AWS Glue Database
#################################################

resource "aws_glue_catalog_database" "lakehouse" {


  name = local.glue_database_name


  description = "Enterprise Data Lakehouse Glue Catalog Database"



  tags = merge(

    var.common_tags,

    {

      Name = local.glue_database_name

      Component = "Glue Data Catalog"

    }

  )

}

