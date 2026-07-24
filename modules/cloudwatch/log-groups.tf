#################################################
# Lambda CloudWatch Log Group
#################################################

resource "aws_cloudwatch_log_group" "lambda" {


  name = "/aws/lambda/${var.lambda_function_name}"



  retention_in_days = 30



  tags = merge(

    var.common_tags,

    {

      Name = "/aws/lambda/${var.lambda_function_name}"


      Component = "Lambda Logging"

    }

  )

}





#################################################
# Step Functions CloudWatch Log Group
#################################################

resource "aws_cloudwatch_log_group" "step_functions" {


  name = "/aws/vendedlogs/states/${var.state_machine_name}"



  retention_in_days = 30



  tags = merge(

    var.common_tags,

    {

      Name = "/aws/vendedlogs/states/${var.state_machine_name}"


      Component = "Step Functions Logging"

    }

  )

}

