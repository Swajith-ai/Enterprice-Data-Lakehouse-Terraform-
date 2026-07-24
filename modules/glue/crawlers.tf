#################################################
# Raw Data Crawler
#################################################

resource "aws_glue_crawler" "raw" {


  name = local.raw_crawler_name


  role = var.glue_role_arn



  database_name = aws_glue_catalog_database.lakehouse.name



  description = "Crawler for raw data lake layer"



  s3_target {

    path = local.raw_s3_location

  }



  schema_change_policy {


    delete_behavior = "LOG"


    update_behavior = "UPDATE_IN_DATABASE"


  }



  tags = merge(

    var.common_tags,

    {

      Name = local.raw_crawler_name

      Layer = "Raw"

    }

  )

}



#################################################
# Processed Data Crawler
#################################################

resource "aws_glue_crawler" "processed" {


  name = local.processed_crawler_name


  role = var.glue_role_arn



  database_name = aws_glue_catalog_database.lakehouse.name



  description = "Crawler for processed data layer"



  s3_target {


    path = local.processed_s3_location


  }



  schema_change_policy {


    delete_behavior = "LOG"


    update_behavior = "UPDATE_IN_DATABASE"


  }



  tags = merge(

    var.common_tags,

    {

      Name = local.processed_crawler_name

      Layer = "Processed"

    }

  )

}

