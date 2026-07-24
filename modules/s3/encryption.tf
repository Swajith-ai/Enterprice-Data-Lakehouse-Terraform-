#################################################
# Raw Bucket Encryption
#################################################

resource "aws_s3_bucket_server_side_encryption_configuration" "raw" {

  bucket = aws_s3_bucket.raw.id

  rule {

    apply_server_side_encryption_by_default {

      kms_master_key_id = var.kms_key_arn

      sse_algorithm = "aws:kms"

    }

    bucket_key_enabled = true

  }

}

#################################################
# Processed Bucket Encryption
#################################################

resource "aws_s3_bucket_server_side_encryption_configuration" "processed" {

  bucket = aws_s3_bucket.processed.id

  rule {

    apply_server_side_encryption_by_default {

      kms_master_key_id = var.kms_key_arn

      sse_algorithm = "aws:kms"

    }

    bucket_key_enabled = true

  }

}

#################################################
# Curated Bucket Encryption
#################################################

resource "aws_s3_bucket_server_side_encryption_configuration" "curated" {

  bucket = aws_s3_bucket.curated.id

  rule {

    apply_server_side_encryption_by_default {

      kms_master_key_id = var.kms_key_arn

      sse_algorithm = "aws:kms"

    }

    bucket_key_enabled = true

  }

}

