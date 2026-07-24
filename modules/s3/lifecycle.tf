#################################################
# S3 Lifecycle Configuration
#################################################

resource "aws_s3_bucket_lifecycle_configuration" "raw" {

  bucket = aws_s3_bucket.raw.id


  rule {

    id = "raw-lifecycle"

    status = "Enabled"


    filter {}

  }

}


resource "aws_s3_bucket_lifecycle_configuration" "processed" {

  bucket = aws_s3_bucket.processed.id


  rule {

    id = "processed-lifecycle"

    status = "Enabled"


    filter {}

  }

}


resource "aws_s3_bucket_lifecycle_configuration" "curated" {

  bucket = aws_s3_bucket.curated.id


  rule {

    id = "curated-lifecycle"

    status = "Enabled"


    filter {}

  }

}