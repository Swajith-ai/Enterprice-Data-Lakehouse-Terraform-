#################################################
# Raw Bucket Policy
#################################################

resource "aws_s3_bucket_policy" "raw" {

  bucket = aws_s3_bucket.raw.id


  policy = jsonencode({

    Version = "2012-10-17"


    Statement = [

      {

        Sid = "DenyHTTPRequests"


        Effect = "Deny"


        Principal = "*"


        Action = "s3:*"


        Resource = [

          aws_s3_bucket.raw.arn,

          "${aws_s3_bucket.raw.arn}/*"

        ]


        Condition = {

          Bool = {

            "aws:SecureTransport" = "false"

          }

        }

      }

    ]

  })

}



#################################################
# Processed Bucket Policy
#################################################

resource "aws_s3_bucket_policy" "processed" {

  bucket = aws_s3_bucket.processed.id


  policy = jsonencode({

    Version = "2012-10-17"


    Statement = [

      {

        Sid = "DenyHTTPRequests"


        Effect = "Deny"


        Principal = "*"


        Action = "s3:*"


        Resource = [

          aws_s3_bucket.processed.arn,

          "${aws_s3_bucket.processed.arn}/*"

        ]


        Condition = {

          Bool = {

            "aws:SecureTransport" = "false"

          }

        }

      }

    ]

  })

}



#################################################
# Curated Bucket Policy
#################################################

resource "aws_s3_bucket_policy" "curated" {

  bucket = aws_s3_bucket.curated.id


  policy = jsonencode({

    Version = "2012-10-17"


    Statement = [

      {

        Sid = "DenyHTTPRequests"


        Effect = "Deny"


        Principal = "*"


        Action = "s3:*"


        Resource = [

          aws_s3_bucket.curated.arn,

          "${aws_s3_bucket.curated.arn}/*"

        ]


        Condition = {

          Bool = {

            "aws:SecureTransport" = "false"

          }

        }

      }

    ]

  })

}

