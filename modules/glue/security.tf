resource "aws_glue_security_configuration" "lakehouse" {

  name = "${var.naming_prefix}-security"

  encryption_configuration {

    cloudwatch_encryption {
      cloudwatch_encryption_mode = "DISABLED"
    }

    job_bookmarks_encryption {
      job_bookmarks_encryption_mode = "CSE-KMS"

      kms_key_arn = var.kms_key_arn
    }

    s3_encryption {
      s3_encryption_mode = "SSE-KMS"

      kms_key_arn = var.kms_key_arn
    }
  }
}