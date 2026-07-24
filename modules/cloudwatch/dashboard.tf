#################################################
# CloudWatch Dashboard
#################################################

resource "aws_cloudwatch_dashboard" "main" {


  dashboard_name = local.dashboard_name



  dashboard_body = jsonencode({


    widgets = [



      #################################################
      # Lambda Metrics Widget
      #################################################

      {


        type = "metric"



        x = 0



        y = 0



        width = 12



        height = 6



        properties = {


          title = "Lambda Execution Metrics"



          region = var.aws_region



          metrics = [


            [

              "AWS/Lambda",

              "Invocations",

              "FunctionName",

              var.lambda_function_name

            ],


            [

              "AWS/Lambda",

              "Errors",

              "FunctionName",

              var.lambda_function_name

            ]


          ]



          stat = "Sum"



        }


      },





      #################################################
      # Step Functions Metrics Widget
      #################################################

      {


        type = "metric"



        x = 12



        y = 0



        width = 12



        height = 6



        properties = {


          title = "Step Functions Execution Metrics"



          region = var.aws_region



          metrics = [


            [

              "AWS/States",

              "ExecutionsSucceeded"

            ],


            [

              "AWS/States",

              "ExecutionsFailed"

            ]


          ]



          stat = "Sum"



        }


      }

    ]


  })

}

