#################################################
# CloudTrail Trail Name
#################################################

output "trail_name" {


  description = "CloudTrail trail name."


  value = aws_cloudtrail.main.name

}





#################################################
# CloudTrail Trail ARN
#################################################

output "trail_arn" {


  description = "CloudTrail trail ARN."


  value = aws_cloudtrail.main.arn

}





#################################################
# Audit Bucket Name
#################################################

output "audit_bucket_name" {


  description = "S3 bucket storing CloudTrail logs."


  value = aws_s3_bucket.audit.bucket

}





#################################################
# Audit Bucket ARN
#################################################

output "audit_bucket_arn" {


  description = "ARN of the CloudTrail audit bucket."


  value = aws_s3_bucket.audit.arn

}

