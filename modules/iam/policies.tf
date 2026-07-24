#################################################
# Glue IAM Policy
#################################################

resource "aws_iam_policy" "glue" {

  name = local.glue_policy_name

  description = "Permissions for AWS Glue."

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Action = [

          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"

        ]

        Resource = [

          var.raw_bucket_arn,
          "${var.raw_bucket_arn}/*",

          var.processed_bucket_arn,
          "${var.processed_bucket_arn}/*",

          var.curated_bucket_arn,
          "${var.curated_bucket_arn}/*"

        ]

      },

      {

        Effect = "Allow"

        Action = [

          "kms:Encrypt",
          "kms:Decrypt",
          "kms:GenerateDataKey"

        ]

        Resource = [

          var.kms_key_arn

        ]

      }

    ]

  })

  tags = merge(
    var.common_tags,
    {
      Name = local.glue_policy_name
    }
  )

}

#################################################
# Lambda IAM Policy
#################################################

resource "aws_iam_policy" "lambda" {

  name = local.lambda_policy_name

  description = "Permissions for AWS Lambda."

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Action = [

          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"

        ]

        Resource = "*"

      },

      {

        Effect = "Allow"

        Action = [

          "kms:Decrypt"

        ]

        Resource = [

          var.kms_key_arn

        ]

      }

    ]

  })

  tags = merge(
    var.common_tags,
    {
      Name = local.lambda_policy_name
    }
  )

}

#################################################
# Athena IAM Policy
#################################################

resource "aws_iam_policy" "athena" {

  name = local.athena_policy_name

  description = "Permissions for Amazon Athena."

  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Action = [

          "s3:GetObject",
          "s3:ListBucket"

        ]

        Resource = [

          var.curated_bucket_arn,
          "${var.curated_bucket_arn}/*"

        ]

      },

      {

        Effect = "Allow"

        Action = [

          "kms:Decrypt"

        ]

        Resource = [

          var.kms_key_arn

        ]

      }

    ]

  })

  tags = merge(
    var.common_tags,
    {
      Name = local.athena_policy_name
    }
  )

}

