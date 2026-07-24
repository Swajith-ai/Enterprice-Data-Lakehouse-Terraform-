#################################################
# QuickSight Dataset
#################################################

resource "aws_quicksight_data_set" "main" {

  count = var.enable_quicksight ? 1 : 0


  data_set_id = local.dataset_name


  name = local.dataset_name


  import_mode = "DIRECT_QUERY"


  physical_table_map {

    physical_table_map_id = "athena-table"


    relational_table {

      data_source_arn = aws_quicksight_data_source.athena[0].arn


      schema = var.athena_database_name


      name = var.athena_database_name


      input_columns {

        name = "id"

        type = "STRING"

      }

    }

  }


  permissions {

    principal = var.quicksight_user_arn


    actions = [

      "quicksight:DescribeDataSet",

      "quicksight:DescribeDataSetPermissions",

      "quicksight:PassDataSet"

    ]

  }


  tags = merge(

    var.common_tags,

    {

      Name = local.dataset_name

      Component = "QuickSight Dataset"

    }

  )

}