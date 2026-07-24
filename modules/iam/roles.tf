#################################################
# Glue IAM Role
#################################################

resource "aws_iam_role" "glue" {

  name = local.glue_role_name

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Principal = {

          Service = "glue.amazonaws.com"

        }

        Action = "sts:AssumeRole"

      }

    ]

  })

  tags = merge(
    var.common_tags,
    {
      Name = local.glue_role_name
    }
  )

}

#################################################
# Lambda IAM Role
#################################################

resource "aws_iam_role" "lambda" {

  name = local.lambda_role_name

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
      Name = local.lambda_role_name
    }
  )

}

#################################################
# Athena IAM Role
#################################################

resource "aws_iam_role" "athena" {

  name = local.athena_role_name

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Principal = {

          Service = "athena.amazonaws.com"

        }

        Action = "sts:AssumeRole"

      }

    ]

  })

  tags = merge(
    var.common_tags,
    {
      Name = local.athena_role_name
    }
  )

}

