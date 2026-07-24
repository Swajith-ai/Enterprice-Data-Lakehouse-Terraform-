#################################################
# Step Functions State Machine
#################################################

resource "aws_sfn_state_machine" "pipeline" {


  name = local.state_machine_name



  role_arn = aws_iam_role.step_functions.arn



  definition = jsonencode({


    Comment = "Enterprise Data Lakehouse Processing Workflow"



    StartAt = "ValidateData"



    States = {


      ValidateData = {


        Type = "Task"



        Resource = var.lambda_function_arn



        Retry = [


          {


            ErrorEquals = [

              "Lambda.ServiceException",

              "Lambda.AWSLambdaException",

              "Lambda.SdkClientException"

            ]



            IntervalSeconds = 2


            MaxAttempts = 3


            BackoffRate = 2


          }

        ]



        End = true


      }


    }


  })



  logging_configuration {


    level = "ALL"



    include_execution_data = true



    log_destination = "${aws_cloudwatch_log_group.step_functions.arn}:*"


  }



  tags = merge(

    var.common_tags,

    {

      Name = local.state_machine_name


      Component = "Workflow Orchestration"

    }

  )

}

