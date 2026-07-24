#################################################
# CloudTrail Audit S3 Bucket
#################################################

resource "aws_s3_bucket" "audit" {


  bucket = var.audit_bucket_name



  tags = merge(

    var.common_tags,

    {

      Name = var.audit_bucket_name


      Component = local.component_name

    }

  )

}





#################################################
# Enable Versioning
#################################################

resource "aws_s3_bucket_versioning" "audit" {


  bucket = aws_s3_bucket.audit.id



  versioning_configuration {


    status = "Enabled"


  }

}





#################################################
# S3 Server Side Encryption
#################################################

resource "aws_s3_bucket_server_side_encryption_configuration" "audit" {


  bucket = aws_s3_bucket.audit.id



  rule {


    apply_server_side_encryption_by_default {


      sse_algorithm = "aws:kms"


      kms_master_key_id = var.kms_key_arn


    }


  }

}





#################################################
# Public Access Block
#################################################

resource "aws_s3_bucket_public_access_block" "audit" {


  bucket = aws_s3_bucket.audit.id



  block_public_acls = true



  block_public_policy = true



  ignore_public_acls = true



  restrict_public_buckets = true

}





#################################################
# Lifecycle Policy
#################################################

resource "aws_s3_bucket_lifecycle_configuration" "audit" {

  bucket = aws_s3_bucket.audit.id


  rule {

    id = "audit-log-retention"


    status = "Enabled"


    filter {}


    expiration {

      days = var.retention_days

    }

  }

}




#################################################
# CloudTrail Bucket Policy
#################################################

resource "aws_s3_bucket_policy" "audit" {


  bucket = aws_s3_bucket.audit.id



  policy = jsonencode({


    Version = "2012-10-17"



    Statement = [


      {


        Sid = "AllowCloudTrailWrite"



        Effect = "Allow"



        Principal = {


          Service = "cloudtrail.amazonaws.com"


        }



        Action = [


          "s3:GetBucketAcl"


        ]



        Resource = aws_s3_bucket.audit.arn


      },


      {


        Sid = "AllowCloudTrailLogs"



        Effect = "Allow"



        Principal = {


          Service = "cloudtrail.amazonaws.com"


        }



        Action = [


          "s3:PutObject"


        ]



        Resource = "${aws_s3_bucket.audit.arn}/AWSLogs/*"



        Condition = {


          StringEquals = {


            "s3:x-amz-acl" = "bucket-owner-full-control"


          }


        }


      }


    ]


  })

}

