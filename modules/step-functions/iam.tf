#################################################
# Step Functions Execution Role
#################################################

resource "aws_iam_role" "step_functions" {


  name = "${var.naming_prefix}-step-functions-role"



  assume_role_policy = jsonencode({

    Version = "2012-10-17"


    Statement = [

      {

        Effect = "Allow"


        Principal = {

          Service = "states.amazonaws.com"

        }


        Action = "sts:AssumeRole"

      }

    ]

  })



  tags = merge(

    var.common_tags,

    {

      Name = "${var.naming_prefix}-step-functions-role"

      Component = "Step Functions IAM"

    }

  )

}






#################################################
# Step Functions Permissions Policy
#################################################

resource "aws_iam_policy" "step_functions" {


  name = "${var.naming_prefix}-step-functions-policy"



  description = "Permissions required by Step Functions workflow"



  policy = jsonencode({


    Version = "2012-10-17"



    Statement = [



      #################################################
      # Lambda Invocation Permission
      #################################################

      {

        Effect = "Allow"


        Action = [

          "lambda:InvokeFunction"

        ]


        Resource = "*"

      },



      #################################################
      # Glue Job Execution Permission
      #################################################

      {

        Effect = "Allow"


        Action = [

          "glue:StartJobRun",

          "glue:GetJobRun",

          "glue:GetJobRuns"

        ]


        Resource = "*"

      },



      #################################################
      # CloudWatch Logging Permission
      #################################################

      {

        Effect = "Allow"


        Action = [

          "logs:CreateLogDelivery",

          "logs:GetLogDelivery",

          "logs:UpdateLogDelivery",

          "logs:DeleteLogDelivery",

          "logs:ListLogDeliveries",

          "logs:PutResourcePolicy",

          "logs:DescribeResourcePolicies",

          "logs:DescribeLogGroups"

        ]


        Resource = "*"

      }

    ]

  })

}






#################################################
# Attach Policy
#################################################

resource "aws_iam_role_policy_attachment" "step_functions" {


  role = aws_iam_role.step_functions.name



  policy_arn = aws_iam_policy.step_functions.arn


}

