#################################################
# Lambda CloudWatch Log Group
#################################################

resource "aws_cloudwatch_log_group" "lambda" {


  name = local.log_group_name



  retention_in_days = 30



  tags = merge(

    var.common_tags,

    {

      Name = local.log_group_name

      Component = "Lambda Logging"

    }

  )

}

