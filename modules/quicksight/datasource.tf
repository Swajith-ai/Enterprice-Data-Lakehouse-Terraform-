#################################################
# QuickSight Athena Data Source
#################################################

resource "aws_quicksight_data_source" "athena" {

  count = var.enable_quicksight ? 1 : 0


  data_source_id = local.datasource_name


  name = local.datasource_name


  type = "ATHENA"


  parameters {

    athena {

      work_group = var.athena_workgroup_name

    }

  }


  permission {

    principal = var.quicksight_user_arn


    actions = [

      "quicksight:DescribeDataSource",

      "quicksight:DescribeDataSourcePermissions",

      "quicksight:PassDataSource"

    ]

  }


  tags = merge(

    var.common_tags,

    {

      Name = local.datasource_name

      Component = "QuickSight"

    }

  )

}