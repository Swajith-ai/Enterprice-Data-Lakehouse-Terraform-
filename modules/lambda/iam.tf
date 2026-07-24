#################################################
# Lambda Execution Role
#################################################

resource "aws_iam_role" "lambda" {


  name = "${var.naming_prefix}-lambda-role"



  assume_role_policy = jsonencode({

    Version = "2012-10-17"


    Statement = [


      {

        Effect = "Allow"


        Principal = {


          Service = "lambda.amazonaws.com"


        }


        Action = "sts:AssumeRole"


      }


    ]

  })



  tags = merge(

    var.common_tags,

    {

      Name = "${var.naming_prefix}-lambda-role"

      Component = "Lambda IAM"

    }

  )

}






#################################################
# Lambda Permissions Policy
#################################################

resource "aws_iam_policy" "lambda" {


  name = "${var.naming_prefix}-lambda-policy"



  description = "Permissions required by Lambda validation function"



  policy = jsonencode({


    Version = "2012-10-17"



    Statement = [



      #################################################
      # CloudWatch Logs Permissions
      #################################################

      {

        Effect = "Allow"


        Action = [

          "logs:CreateLogGroup",

          "logs:CreateLogStream",

          "logs:PutLogEvents"

        ]


        Resource = "*"

      },



      #################################################
      # S3 Read Permissions
      #################################################

      {

        Effect = "Allow"


        Action = [

          "s3:GetObject",

          "s3:ListBucket"

        ]


        Resource = "*"

      }


    ]


  })


}





#################################################
# Attach Policy To Role
#################################################

resource "aws_iam_role_policy_attachment" "lambda" {


  role = aws_iam_role.lambda.name



  policy_arn = aws_iam_policy.lambda.arn


}

