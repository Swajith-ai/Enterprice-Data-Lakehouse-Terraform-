#################################################
# Raw Data Bucket
#################################################

resource "aws_s3_bucket" "raw" {

  bucket = local.raw_bucket_name

  tags = merge(
    var.common_tags,
    {
      Name        = local.raw_bucket_name
      DataLayer   = "Raw"
      Description = "Stores original source data."
    }
  )

}

#################################################
# Processed Data Bucket
#################################################

resource "aws_s3_bucket" "processed" {

  bucket = local.processed_bucket_name

  tags = merge(
    var.common_tags,
    {
      Name        = local.processed_bucket_name
      DataLayer   = "Processed"
      Description = "Stores cleaned and transformed data."
    }
  )

}

#################################################
# Curated Data Bucket
#################################################

resource "aws_s3_bucket" "curated" {

  bucket = local.curated_bucket_name

  tags = merge(
    var.common_tags,
    {
      Name        = local.curated_bucket_name
      DataLayer   = "Curated"
      Description = "Stores analytics-ready datasets."
    }
  )

}

#################################################
# Ownership Controls - Raw Bucket
#################################################

resource "aws_s3_bucket_ownership_controls" "raw" {

  bucket = aws_s3_bucket.raw.id

  rule {

    object_ownership = "BucketOwnerPreferred"

  }

}

#################################################
# Ownership Controls - Processed Bucket
#################################################

resource "aws_s3_bucket_ownership_controls" "processed" {

  bucket = aws_s3_bucket.processed.id

  rule {

    object_ownership = "BucketOwnerPreferred"

  }

}

#################################################
# Ownership Controls - Curated Bucket
#################################################

resource "aws_s3_bucket_ownership_controls" "curated" {

  bucket = aws_s3_bucket.curated.id

  rule {

    object_ownership = "BucketOwnerPreferred"

  }

}

#################################################
# Public Access Block - Raw Bucket
#################################################

resource "aws_s3_bucket_public_access_block" "raw" {

  bucket = aws_s3_bucket.raw.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true

}

#################################################
# Public Access Block - Processed Bucket
#################################################

resource "aws_s3_bucket_public_access_block" "processed" {

  bucket = aws_s3_bucket.processed.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true

}

#################################################
# Public Access Block - Curated Bucket
#################################################

resource "aws_s3_bucket_public_access_block" "curated" {

  bucket = aws_s3_bucket.curated.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true

}

