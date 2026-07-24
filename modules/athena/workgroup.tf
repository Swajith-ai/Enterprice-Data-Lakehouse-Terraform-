#################################################
# Athena Workgroup
#################################################

resource "aws_athena_workgroup" "lakehouse" {


  name = local.workgroup_name



  description = local.workgroup_description



  configuration {


    enforce_workgroup_configuration = true



    publish_cloudwatch_metrics_enabled = true



    result_configuration {


      output_location = local.query_results_location



      encryption_configuration {


        encryption_option = "SSE_KMS"


        kms_key_arn = var.kms_key_arn


      }


    }


  }



  tags = merge(

    var.common_tags,

    {

      Name = local.workgroup_name

      Component = "Athena Analytics"

    }

  )

}

