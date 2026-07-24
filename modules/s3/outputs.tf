output "raw_bucket_name" {
  value = aws_s3_bucket.raw.bucket
}

output "processed_bucket_name" {
  value = aws_s3_bucket.processed.bucket
}

output "curated_bucket_name" {
  value = aws_s3_bucket.curated.bucket
}

output "raw_bucket_arn" {
  value = aws_s3_bucket.raw.arn
}

output "processed_bucket_arn" {
  value = aws_s3_bucket.processed.arn
}

output "curated_bucket_arn" {
  value = aws_s3_bucket.curated.arn
}

output "bucket_name" {
  value = aws_s3_bucket.curated.bucket
}

output "athena_results_bucket" {
  value = aws_s3_bucket.curated.bucket
}

output "audit_bucket_name" {
  value = aws_s3_bucket.curated.bucket
}