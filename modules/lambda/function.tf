#################################################
# Lambda Validation Function
#################################################

resource "aws_lambda_function" "validation" {


  function_name = local.function_name



  description = local.function_description



  role = aws_iam_role.lambda.arn



  runtime = var.runtime



  handler = var.handler



  filename = "${path.module}/lambda_function.zip"



  timeout = 60



  memory_size = 256



  environment {


    variables = {


      SOURCE_BUCKET = var.source_bucket_name



      ENVIRONMENT = var.common_tags["Environment"]


    }


  }



  tags = merge(

    var.common_tags,

    {

      Name = local.function_name

      Component = "Lambda Function"

    }

  )



}

