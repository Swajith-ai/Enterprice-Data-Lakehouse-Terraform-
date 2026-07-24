#################################################
# SNS Topic ARN
#################################################

output "topic_arn" {


  description = "SNS topic ARN used for publishing alerts."


  value = aws_sns_topic.alerts.arn

}





#################################################
# SNS Topic Name
#################################################

output "topic_name" {


  description = "SNS topic name."


  value = aws_sns_topic.alerts.name

}





#################################################
# Email Subscription ARN
#################################################

output "subscription_arn" {


  description = "SNS email subscription ARN."


  value = length(aws_sns_topic_subscription.email) > 0 ? aws_sns_topic_subscription.email[0].arn : null

}

